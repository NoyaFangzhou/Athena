//
//  ViewController.swift
//  Athena
//
//  Created by Laura Bochenek on 3/15/17.
//  Copyright © 2017 Laura Bochenek. All rights reserved.
//  Sources:
//     1. using AWSPolly: https://github.com/awslabs/aws-sdk-ios-samples/tree/master/Polly-Sample/Swift
//     2. text input stuff: https://developer.apple.com/library/content/referencelibrary/GettingStarted/DevelopiOSAppsSwift/
//     3. ending editing: http://stackoverflow.com/questions/24126678/close-ios-keyboard-by-touching-anywhere-using-swift
//     4. google speech stuff: https://github.com/GoogleCloudPlatform/ios-docs-samples/tree/master/speech/Swift/Speech-gRPC-Streaming

import UIKit
import AVFoundation
import AWSMobileHubHelper
import AWSPolly
import googleapis

let SAMPLE_RATE = 16000

class MainViewController: UIViewController, AudioControllerDelegate {
    
    //var selectedVoice: AWSPollyVoiceId!
    var audioAPIPlayer = AVPlayer()
    var audioData: NSMutableData!
    var recordingAudioData: Bool!
    var userPronunciationTranscript: String!
    var userPronunciationTranscriptConfidence: Float!
    var brain: EvaluationBrain!
    var signInObserver: AnyObject!
    var signOutObserver: AnyObject!

    @IBOutlet weak var logoutButton: UIBarButtonItem!
    @IBOutlet weak var userTextView: UITextView!
    @IBOutlet weak var recordButton: UIButton!
    
    override func viewDidLoad() {
        print("\n\nviewDidLoad Main\n\n")
        super.viewDidLoad()
        
        signInObserver = NotificationCenter.default.addObserver(forName: NSNotification.Name.AWSIdentityManagerDidSignIn, object: AWSIdentityManager.default(), queue: OperationQueue.main, using: {[weak self] (note: Notification) -> Void in
            guard let strongSelf = self else { return }
            print("Sign In Observer observed sign in.")
            strongSelf.showPronunciationPracticeView()
        })
        
        signOutObserver = NotificationCenter.default.addObserver(forName: NSNotification.Name.AWSIdentityManagerDidSignOut, object: AWSIdentityManager.default(), queue: OperationQueue.main, using: {[weak self](note: Notification) -> Void in
            guard let strongSelf = self else { return }
            print("Sign Out Observer observed sign out.")
            strongSelf.showLoginView()
        })
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        //Uncomment the line below if you want the tap to not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        
        AudioController.sharedInstance.delegate = self
        
        self.recordingAudioData = false
        self.userPronunciationTranscript = nil
        self.userPronunciationTranscriptConfidence = nil
        self.brain = EvaluationBrain()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        if (self.signInObserver != nil) {
            NotificationCenter.default.removeObserver(signInObserver)
        }
        
        if (self.signOutObserver != nil) {
             NotificationCenter.default.removeObserver(signOutObserver)
        }
    }
    
    //MARK: Navigation flow
    func showLoginView() {
        let storyboard = UIStoryboard(name: "SignIn", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SignInViewController")
        DispatchQueue.main.async(execute: {
            self.present(viewController, animated:true, completion: nil);
        })
    }
    
    func showPronunciationPracticeView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MainViewController")
        DispatchQueue.main.async(execute: {
            self.present(viewController, animated:true, completion: nil);
        })
    }
    
    //MARK: handle login and logout
    func handleLogout() {
        if (AWSIdentityManager.default().isLoggedIn) {
            AWSIdentityManager.default().logout(completionHandler: {(result: Any?, error: Error?) in
                let storyboard = UIStoryboard(name: "SignIn", bundle: nil)
                let viewController = storyboard.instantiateViewController(withIdentifier: "SignInViewController")
                self.present(viewController, animated:true, completion: nil)
            })
            // print("Logout Successful: \(signInProvider.getDisplayName)");
        } else {
            assert(false)
        }
    }
    
    @IBAction func logoutButtonPressed(_ sender: Any) {
        handleLogout()
    }
    
    //MARK: actions
    @IBAction func getCorrectPronunciation(_ sender: Any) {
        print("getCorrectPronunciation\n")
        let text: String = getPronunciationText()
        if text.isEmpty {
            //make some kind of popup to prompt user to input stuff
            //for now:
            print("getCorrectPronuncation no text!\n")
        } else {
            callPolly()
        }
    }
    
    @IBAction func recordPronunciation(_ sender: Any) {
        if self.recordingAudioData == true { //turn off recording
            print("recordPronunciation turning off recording\n")
            changeRecordPronunciation(recording: false)
            _ = AudioController.sharedInstance.stop()
            SpeechRecognitionService.sharedInstance.stopStreaming()
        } else { //turn on recording
            //turning on recording
            changeRecordPronunciation(recording: true)
            let audioSession = AVAudioSession.sharedInstance()
            do {
                try audioSession.setCategory(AVAudioSessionCategoryRecord)
            } catch {
                
            }
            audioData = NSMutableData()
            _ = AudioController.sharedInstance.prepare(specifiedSampleRate: SAMPLE_RATE)
            SpeechRecognitionService.sharedInstance.sampleRate = SAMPLE_RATE
            _ = AudioController.sharedInstance.start()
        }
    }
    
    //MARK: helper functions
    func getPronunciationText() -> String {
        return userTextView.text
    }
    
    func changeRecordPronunciation(recording: Bool) {
        //http://stackoverflow.com/questions/26641571/how-to-change-button-text-in-swift-xcode-6
        if recording == false {
            self.recordingAudioData = false
            recordButton.setTitle("Record", for: .normal)
        } else {
            self.recordingAudioData = true
            recordButton.setTitle("Stop", for: .normal)
        }
    }
    
    func processSampleData(_ data: Data) -> Void {
        audioData.append(data)
        
        // We recommend sending samples in 100ms chunks
        let chunkSize : Int /* bytes/chunk */ = Int(0.1 /* seconds/chunk */
            * Double(SAMPLE_RATE) /* samples/second */
            * 2 /* bytes/sample */);
        
        if (audioData.length > chunkSize) {
            SpeechRecognitionService.sharedInstance.streamAudioData(audioData,
                                                                    completion:
                { [weak self] (response, error) in
                    guard let strongSelf = self else {
                        return
                    }
                    
                    if let error = error {
                        //HANDLE ERRORS
                    } else if let response = response {
                        var finished = false
                        for result in response.resultsArray! {
                            if let result = result as? StreamingRecognitionResult {
                                if result.isFinal {
                                    finished = true
                                }
                            }
                        }
                        if finished {
                            for result in response.resultsArray {
                                if let result = result as? StreamingRecognitionResult {
                                    if let alternative = result.alternativesArray[0] as? SpeechRecognitionAlternative {
                                        strongSelf.getPronunciationScore(googleResult: alternative.transcript, userText: strongSelf.getPronunciationText())
                                    }
                                }
                            }
                        }
                    }
            })
            self.audioData = NSMutableData()
        }
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    // MARK: API handling
    func callPolly() {
        print("call polly\n")
        let input = AWSPollySynthesizeSpeechURLBuilderRequest()
        
        input.text = getPronunciationText()
        input.outputFormat = AWSPollyOutputFormat.mp3
        input.voiceId = AWSPollyVoiceId.joanna
        
        let builder = AWSPollySynthesizeSpeechURLBuilder.default().getPreSignedURL(input)
        
        builder.continueOnSuccessWith { (awsTask: AWSTask<NSURL>) -> Any? in
            let url = awsTask.result!
            print("get url\n")
            print(url)
            
            self.audioAPIPlayer.replaceCurrentItem(with: AVPlayerItem(url: url as URL))
            self.audioAPIPlayer.play()
            
            return nil
        }

    }
    
    //MARK: algorithm processing
    func getPronunciationScore(googleResult: String, userText: String) {
        //need to handle error case, but...
        //and case where text field is blank
        var score = brain.calSimilarity(test: googleResult, standard: userText)
        print("SCORE: \(score)\n")
    }
}

