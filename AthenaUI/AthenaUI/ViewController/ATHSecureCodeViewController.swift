//
//  ATHSecureCodeViewController.swift
//  AthenaUI
//
//  Created by Fangzhou Liu on 17/4/17.
//  Copyright © 2017年 Fangzhou Liu. All rights reserved.
//

import UIKit

class ATHSecureCodeViewController: ATHBaseViewController, ATHFootViewDelegate, ATHSignInViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var header = ATHHeadView(frame: CGRect(x: 0.0, y: STATUS_BAR_HEIGHT, width: Double(SCREEN_WIDTH), height: NAVIGATION_BAR_HEIGHT), title: "", left: ATHHeaderItemType.ATHReturn, right: ATHHeaderItemType.ATHNULL)
    
        
        let securecode = ATHInputView(frame: CGRect(x: 0.0, y: 300.0, width: SCREEN_WIDTH, height: 60), title: "Enter Code", titleColor: PLACEHOLDER_COLOR, textColor: UIColor.white)
        self.scrollView.addSubview(securecode)
        
        // Add the sign in button
        let signup_btn = ATHLogButton(frame: CGRect(x: 25, y: securecode.y+securecode.height+50, width: SCREEN_WIDTH-50, height: 40), title: "Sign Up", bgcolor: BTN_BACKGROUND_COLOR)
        signup_btn.addTarget(self, action: #selector(self.signUp(_:)), for: .touchUpInside)
        self.scrollView.addSubview(signup_btn)
        
        // Do any additional setup after loading the view, typically from a nib.
        let footer = ATHFootView(frame: CGRect(x: 0, y: SCREEN_HEIGHT-44-header.y-header.height, width: SCREEN_WIDTH, height: 44), label: "Aleady have an account?", btntitle: "Sign In")
        footer.delegate = self
        self.scrollView.addSubview(footer)
        self.view.addSubview(header)
        
        
    }
    
    func signUp(_ sender: UIButton) {
        
    }
    
    // MARK: ATHFootViewDelegate
    
    func sign_up(_ sender: UIButton) {
        
    }
    
    // MARK: ATHSignInViewDelegate
    func keyboardDisappear() {
        
    }
    
    func keyboardAppear(_ offset: Double) {
        
    }
    
    
}
