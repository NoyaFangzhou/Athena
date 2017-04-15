//
//  ATHLabel.swift
//  AthenaUI
//
//  Created by Fangzhou Liu on 17/4/14.
//  Copyright © 2017年 Fangzhou Liu. All rights reserved.
//

import UIKit

class ATHLabel: UILabel {
    
    init(frame: CGRect, text: String, color: UIColor, size: CGFloat) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        self.text = text
        self.font = UIFont.boldSystemFont(ofSize: size)
        self.textAlignment = NSTextAlignment.center
        self.textColor = color
        self.adjustsFontSizeToFitWidth = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
