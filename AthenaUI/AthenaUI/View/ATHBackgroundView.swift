//
//  ATHBackgroundVieww.swift
//  AthenaUI
//
//  Created by Fangzhou Liu on 17/4/14.
//  Copyright © 2017年 Fangzhou Liu. All rights reserved.
//

import UIKit

class ATHBackgroundView: ATHBaseView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = TEXTVIEW_BACKGROUND_COLOR
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
