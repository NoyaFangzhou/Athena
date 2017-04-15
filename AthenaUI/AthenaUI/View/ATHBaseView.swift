//
//  ATHBaseView.swift
//  AthenaUI
//
//  Created by Fangzhou Liu on 17/4/13.
//  Copyright © 2017年 Fangzhou Liu. All rights reserved.
//

import UIKit

class ATHBaseView: UIView {
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        print("Add Lines")
        ADDLINE(view: self, color: BOTTOM_LINE_COLOR, width: 0.5)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
