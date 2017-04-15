//
//  File.swift
//  AthenaUI
//
//  Created by Fangzhou Liu on 17/4/12.
//  Copyright © 2017年 Fangzhou Liu. All rights reserved.
//

import UIKit

protocol ATHInputViewDelegate {
    func keyboardAppear(_ offset: Double)
    func keyboardDisappear()
}

class ATHInputView: ATHBaseView, UITextFieldDelegate {
    
    var title: String
    var delegate: ATHInputViewDelegate!
    var isMoved = false
    public var titleLabel: UILabel
    public var input: UITextField
    
    //new
    init(frame: CGRect, title: String, titleColor: UIColor, textColor: UIColor) {
        self.title = title
        // build the titleLabel
        self.titleLabel = UILabel(frame: CGRect(x: frame.x, y: 0, width: frame.width, height: frame.height/2))
        self.titleLabel.textAlignment = NSTextAlignment.center
        self.titleLabel.textColor = titleColor
        self.titleLabel.text = title
        
        // build the input textfield
        self.input = UITextField(frame: CGRect(x: frame.x, y: self.titleLabel.height, width: frame.width, height: frame.height-self.titleLabel.height))
        
        self.input.placeholder = "Please input your \(title)"
        self.input.textAlignment = NSTextAlignment.center
        self.input.textColor = textColor
        super.init(frame: frame)
        self.input.delegate = self
        self.addSubview(titleLabel)
        self.addSubview(input)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: UITextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let ky = Double(SCREEN_HEIGHT) - KEYBOARD_HEIGHT - NAVIGATION_BAR_HEIGHT - STATUS_BAR_HEIGHT
        var offset = 0.0
        print("\(Double(self.y + self.height + 10)) >= \(ky) ")
        // Part Covered
        if (Double(self.y) < ky && Double(self.y) + Double(self.height) > ky) {
            print("Partial Cover")
            offset = 10.0 + Double(textField.height) + ky - Double(self.y + self.titleLabel.y)
            isMoved = true
            self.delegate.keyboardAppear(offset)
        }
            // Fully Covered
        else if Double(self.y) >= ky {
            // MOVE
            print("Fully Cover")
            offset = Double(self.y + 10 + self.height) - ky
            isMoved = true
            self.delegate.keyboardAppear(offset)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if isMoved {
            self.delegate.keyboardDisappear()
        }
        return true
    }
    
    
    
  
    
}





