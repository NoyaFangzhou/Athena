//
//  ATHTextView.swift
//  AthenaUI
//
//  Created by Fangzhou Liu on 17/4/14.
//  Copyright © 2017年 Fangzhou Liu. All rights reserved.
//

import UIKit

protocol ATHTextViewDelegate {
    func keyboardAppear()
    func keyboardDisappear()
}
class ATHTextView: ATHBackgroundView, UITextViewDelegate {
    
    var input: UITextView
    
    var delegate: ATHTextViewDelegate!
    
    var isChanged = false
    
    var placeholder: String
    
    init(frame: CGRect, placeholder: String) {
        
        input = UITextView(frame: CGRect(x: 5, y: 5, width: frame.width-10, height: frame.height-10))
        input.text = placeholder
        input.textColor = PLACEHOLDER_COLOR
        input.backgroundColor = UIColor.clear
        self.placeholder = placeholder
        super.init(frame: frame)
        input.delegate = self
        self.addSubview(input)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: UITextViewDelegate
    func textViewDidBeginEditing(_ textView: UITextView) {
        if !isChanged {
            textView.text = ""
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if !isChanged {
            textView.text = self.placeholder
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        isChanged = true
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            if text.isEmpty {
                isChanged = false
            }
            return false
        }
        return true
    }
    
}
