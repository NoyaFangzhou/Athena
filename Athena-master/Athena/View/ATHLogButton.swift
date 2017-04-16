//
//  ATHLogButton.swift
//  AthenaUI
//
//  Created by Fangzhou Liu on 17/4/12.
//  Copyright © 2017年 Fangzhou Liu. All rights reserved.
//

import UIKit

class ATHLogButton: UIButton {
    
    var title = ""
    
    init(frame: CGRect, title: String, bgcolor: UIColor) {
        super.init(frame: frame)
        self.title = title
        self.titleLabel!.textAlignment = NSTextAlignment.center
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 20.0
        self.backgroundColor = bgcolor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
