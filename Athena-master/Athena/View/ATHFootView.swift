//
//  ATHFootView.swift
//  AthenaUI
//
//  Created by Fangzhou Liu on 17/4/13.
//  Copyright © 2017年 Fangzhou Liu. All rights reserved.
//

import UIKit

protocol ATHFootViewDelegate {
    func sign_up(_ sender: UIButton)
}

class ATHFootView: UIView {
    
    var label: UILabel
    var btn:   UIButton
    var delegate: ATHFootViewDelegate!
    
    init(frame: CGRect, label: String, btntitle: String) {
        
        self.label = UILabel(frame: CGRect(x: 50, y: 5, width: 200, height: frame.height-10))
        self.label.text = label
        self.label.textColor = PLACEHOLDER_COLOR
        self.btn = UIButton(frame: CGRect(x: self.label.x+self.label.width+5, y: self.label.y, width: 100, height: self.label.height))
        self.btn.setTitle(btntitle, for: .normal)
        self.btn.setTitleColor(UIColor.white, for:.normal)
        super.init(frame: frame)
//        VIEWBORDER(view: self.label, color: UIColor.orange, width: 2.0)
//        VIEWBORDER(view: self.btn, color: UIColor.orange, width: 2.0)
        self.addSubview(self.label)
        self.addSubview(self.btn)
        self.btn.addTarget(self, action: #selector(btn_clicked(_:)), for: .touchUpInside)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func btn_clicked(_ sender: UIButton) {
        self.delegate.sign_up(sender)
    }
    
    
}
