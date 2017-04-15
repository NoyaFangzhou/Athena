//
//  ATHPracticeViewController.swift
//  AthenaUI
//
//  Created by Fangzhou Liu on 17/4/14.
//  Copyright © 2017年 Fangzhou Liu. All rights reserved.
//

import UIKit

class ATHPracticeViewController: ATHBaseViewController, ATHTextViewDelegate {
    
    var isLoading = false
    
    private let loadingGroup = STLoadingGroup(side: 100.0, style: STLoadingStyle.submit)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var header = ATHHeadView(frame: CGRect(x: 0.0, y: STATUS_BAR_HEIGHT, width: Double(SCREEN_WIDTH), height: NAVIGATION_BAR_HEIGHT), title: "", left: ATHHeaderItemType.ATHReturn, right: ATHHeaderItemType.ATHMenu)
        self.view.addSubview(header)
        
        var textInput = ATHTextView(frame: CGRect(x: 35.0, y: Double(header.y+header.height)+30.0, width: Double(SCREEN_WIDTH-60.0), height: 400), placeholder: "Type the text you want to practice")
        textInput.delegate = self
//        VIEWBORDER(view: textInput, color: UIColor.red, width: 2.0)
        self.view.addSubview(textInput)
        
        var playButton = ATHRoundButton(frame: CGRect(x: (SCREEN_WIDTH-240.0)/2, y: textInput.y+textInput.height+30.0, width: 90.0, height: 90.0), image: UIImage(named: ATHImageName.ATHPlay.rawValue)!, selected: BTN_BACKGROUND_COLOR)
//        VIEWBORDER(view: playButton, color: BTN_BACKGROUND_COLOR, width: 5.0)
        self.view.addSubview(playButton)
        var recordButton = ATHRoundButton(frame: CGRect(x: playButton.x+playButton.width+50.0, y: textInput.y+textInput.height+30.0, width: 90.0, height: 90.0), image: UIImage(named: ATHImageName.ATHMicrophone_EN.rawValue)!, selected: BTN_BACKGROUND_COLOR)
        VIEWBORDER(view: recordButton, color: GREEN_BORDER_COLOR, width: 5.0)
        self.view.addSubview(recordButton)
        playButton.addTarget(self, action: #selector(play(_:)), for: .touchUpInside)
        
    
    }
    
    // MARK: ATHTextViewDelegate
    func keyboardAppear() {
        // do something
    }
    
    func keyboardDisappear() {
        // do something
    }
    
    func play(_ sender: UIButton) {
        if !isLoading {
            VIEWBORDER(view: sender, color: BTN_BACKGROUND_COLOR, width: 5.0)
            loadingGroup.show(self.view)
            loadingGroup.startLoading()
            isLoading = true
        }
        else {
            VIEWBORDER(view: sender, color: UIColor.clear, width: 5.0)
            print("stop loading")
            loadingGroup.stopLoading()
        }
    }
}
