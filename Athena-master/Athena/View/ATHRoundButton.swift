//
//  ATHRoundButton.swift
//  AthenaUI
//
//  Created by Fangzhou Liu on 17/4/14.
//  Copyright © 2017年 Fangzhou Liu. All rights reserved.
//

import UIKit

class ATHRoundButton: UIButton {
    
    init(frame: CGRect, image: UIImage, selected: UIColor) {
        super.init(frame: frame)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 0.5 * self.width
        self.setImage(image, for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
