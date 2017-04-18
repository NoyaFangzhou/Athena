//
//  ATHMainViewController.swift
//  AthenaUI
//
//  Created by Fangzhou Liu on 17/4/13.
//  Copyright © 2017年 Fangzhou Liu. All rights reserved.
//

import UIKit

class ATHMainViewController: ATHBaseViewController, ATHSignInViewDelegate, ATHFootViewDelegate {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add two input text field
        let username = ATHSignInView(frame: CGRect(x: 0, y: 400, width: SCREEN_WIDTH, height: 60), type: ATHInputStyle.ATHNormal)
        let password = ATHSignInView(frame: CGRect(x: 0, y: username.y+username.height, width: SCREEN_WIDTH, height: 60), type: ATHInputStyle.ATHPassword)
//        VIEWBORDER(view: username, color: UIColor.white, width: 2.0)
//        VIEWBORDER(view: password, color: UIColor.white, width: 2.0)
        username.delegate = self
        password.delegate = self
        self.scrollView.addSubview(username)
        self.scrollView.addSubview(password)
        
        // Add the sign in button
        let signin_btn = ATHLogButton(frame: CGRect(x: 25, y: password.y+password.height+50, width: SCREEN_WIDTH-50, height: 40), title: "Sign In", bgcolor: BTN_BACKGROUND_COLOR)
        signin_btn.addTarget(self, action: #selector(self.log_in(_:)), for: .touchUpInside)
        self.scrollView.addSubview(signin_btn)
        
        // Do any additional setup after loading the view, typically from a nib.
        let footer = ATHFootView(frame: CGRect(x: 0, y: SCREEN_HEIGHT-44, width: SCREEN_WIDTH, height: 44), label: "Don't have an account?", btntitle: "Sign Up")
        footer.delegate = self
        self.scrollView.addSubview(footer)

    }
    
    func log_in(_ sender: UIButton)  {
        print("\(sender.titleLabel?.text)")
    }
    
    // MARK: ATHSignInViewDelegate
    
    func keyboardAppear(_ offset: Double) {
        print("Offset up \(offset)")
        self.scrollView.contentOffset = CGPoint(x: 0.0, y: offset)
    }
    
    func keyboardDisappear() {
        print("Offset down")
        self.scrollView.contentOffset = CGPoint(x: 0.0, y: 0.0)
    }
    
    // MARK: ATHFooterViewDelegate
    
    func sign_up(_ sender: UIButton) {
        let signUpVC = self.storyboard!.instantiateViewController(withIdentifier: "ATHSignUpViewController")
        self.navigationController!.pushViewController(signUpVC, animated: true)
//        self.present(viewController, animated:true, completion: nil)
        print("\(sender.titleLabel?.text)")
    }
    
}
