//
//  ATHSignUpViewController.swift
//  AthenaUI
//
//  Created by Fangzhou Liu on 17/4/13.
//  Copyright © 2017年 Fangzhou Liu. All rights reserved.
//

import UIKit

class ATHSignUpViewController: ATHBaseViewController, ATHInputViewDelegate, ATHFootViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Add header
        let header = ATHHeadView(frame: CGRect(x: 0.0, y: STATUS_BAR_HEIGHT, width: Double(SCREEN_WIDTH), height: NAVIGATION_BAR_HEIGHT), title: "Sign Up", left: ATHHeaderItemType.ATHReturn, right: ATHHeaderItemType.ATHNULL)
        
        let username = ATHInputView(frame: CGRect(x: 0.0, y: 0, width: SCREEN_WIDTH, height: 80), title: "Username", titleColor: PLACEHOLDER_COLOR, textColor: UIColor.white, type: ATHInputStyle.ATHNormal, placeholder: "Please Input your username")
        username.delegate = self
        self.scrollView.addSubview(username)
//        VIEWBORDER(view: username, color: UIColor.orange, width: 2.0)
        let email  = ATHInputView(frame: CGRect(x: 0.0, y: username.y+username.height+5, width: SCREEN_WIDTH, height: 80), title: "Email Address", titleColor: PLACEHOLDER_COLOR, textColor: UIColor.white, type: ATHInputStyle.ATHEmail, placeholder: "Please Input your email address")
        email.delegate = self
        self.scrollView.addSubview(email)
//        VIEWBORDER(view: email, color: UIColor.orange, width: 2.0)
        let language  = ATHInputView(frame: CGRect(x: 0.0, y: email.y+email.height+5, width: SCREEN_WIDTH, height: 80), title: "Native Language", titleColor: PLACEHOLDER_COLOR, textColor: UIColor.white, type: ATHInputStyle.ATHLanguage, placeholder: "Please Select your Native Language")
        language.delegate = self
        self.scrollView.addSubview(language)
//        VIEWBORDER(view: language, color: UIColor.orange, width: 2.0)
        let password  = ATHInputView(frame: CGRect(x: 0.0, y: language.y+language.height+15, width: SCREEN_WIDTH, height: 80), title: "Password", titleColor: PLACEHOLDER_COLOR, textColor: UIColor.white, type: ATHInputStyle.ATHPassword, placeholder: "Please Input your password")
        password.delegate = self
        self.scrollView.addSubview(password)
//        VIEWBORDER(view: password, color: UIColor.orange, width: 2.0)
        let confirm_pwd  = ATHInputView(frame: CGRect(x: 0.0, y: password.y+password.height+5, width: SCREEN_WIDTH, height: 80), title: "Confirm Password", titleColor: PLACEHOLDER_COLOR, textColor: UIColor.white, type: ATHInputStyle.ATHPassword, placeholder: "Please Input your password again")
        confirm_pwd.delegate = self
        self.scrollView.addSubview(confirm_pwd)
//        VIEWBORDER(view: confirm_pwd, color: UIColor.orange, width: 2.0)
        let next = ATHLogButton(frame: CGRect(x: 25, y: confirm_pwd.y+confirm_pwd.height+50, width: SCREEN_WIDTH-50, height: 40), title: "Next", bgcolor: BTN_BACKGROUND_COLOR)
        next.addTarget(self, action: #selector(self.next(_:)), for: .touchUpInside)
        self.scrollView.addSubview(next)
        
        
        // Add footer
        let footer = ATHFootView(frame: CGRect(x: 0, y: SCREEN_HEIGHT-44-header.y-header.height, width: SCREEN_WIDTH, height: 44), label: "Aleady have an account?", btntitle: "Sign In")
//        VIEWBORDER(view: footer, color: UIColor.cyan, width: 2.0)
        footer.delegate = self
        self.scrollView.addSubview(footer)
        self.view.addSubview(header)
        
    }
    
    // MARK: Next Botton Clicked
    func next(_ sender: UIButton) {
        print("\(sender.titleLabel?.text)")
    }
    
    // MARK: ATHInputViewDelegate
    func keyboardAppear(_ offset: Double) {
        print("Offset up \(offset)")
        self.scrollView.contentOffset = CGPoint(x: 0.0, y: offset)
    }
    
    func keyboardDisappear(_ text: String, _ type: ATHInputStyle) {
        print("Offset down")
        self.scrollView.contentOffset = CGPoint(x: 0.0, y: 0.0)
    }
    
    
    // MARK: ATHFootViewDelegate
    func sign_up(_ sender: UIButton) {
        print("\(sender.titleLabel?.text)")
    }
    
    
    
}
