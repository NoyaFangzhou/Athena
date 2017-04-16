//
//  ATHSignInView.swift
//  AthenaUI
//
//  Created by Fangzhou Liu on 17/4/13.
//  Copyright © 2017年 Fangzhou Liu. All rights reserved.
//

import UIKit

protocol ATHSignInViewDelegate {
    func keyboardAppear(_ offset: Double)
    func keyboardDisappear(_ text: String, _ tag: ATHInputStyle)
}

class ATHSignInView: ATHBaseView, UITextFieldDelegate {
    
    var delegate: ATHSignInViewDelegate!
    
    var input: UITextField
    
    var isMoved = false
    
    let type: ATHInputStyle
    
    init(frame: CGRect, type: ATHInputStyle) {
        self.input = UITextField(frame: CGRect(x: 20, y: 5, width: frame.width-40, height: frame.height-10))
        self.type = type
        switch type {
        case ATHInputStyle.ATHNormal:
            self.input.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSForegroundColorAttributeName: PLACEHOLDER_COLOR])
            break
        case ATHInputStyle.ATHPassword:
            self.input.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSForegroundColorAttributeName: PLACEHOLDER_COLOR])
            self.input.isSecureTextEntry = true
            break
        default:
            break
        }
        self.input.textAlignment = NSTextAlignment.center
        self.input.textColor = PLACEHOLDER_COLOR
//        VIEWBORDER(view: self.input, color: UIColor.red, width: 2.0)
        super.init(frame: frame)
        self.input.delegate = self
        self.addSubview(input)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: UITextField Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Return")
        if isMoved {
            self.delegate.keyboardDisappear(textField.text!, self.type)
        }
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let ky = Double(SCREEN_HEIGHT) - KEYBOARD_HEIGHT
        var offset = 0.0
        print("\(Double(self.y + textField.height + 10)) >= \(ky) ")
        // Part Covered
        if (Double(self.y) < ky && Double(self.y) + Double(self.height) > ky) {
            print("Partial Cover")
            offset = 10.0 + Double(self.height)
            isMoved = true
            self.delegate.keyboardAppear(offset)
        }
        // Fully Covered
        else if Double(self.y + self.height) >= ky {
            // MOVE
            print("Fully Cover")
            offset = Double(self.y + 10 + self.height) - ky
            isMoved = true
            self.delegate.keyboardAppear(offset)
        }
    }
  
}
