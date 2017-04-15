//
//  ATHBlurView.swift
//  AthenaUI
//
//  Created by Fangzhou Liu on 17/4/14.
//  Copyright © 2017年 Fangzhou Liu. All rights reserved.
//

import UIKit

class ATHBlurView: UIView {
    
    override init(frame: CGRect) {
        
        //首先创建一个模糊效果
        let blurEffect = UIBlurEffect(style: .light)
        //接着创建一个承载模糊效果的视图
        let blurView = UIVisualEffectView(effect: blurEffect)
        //设置模糊视图的大小（全屏）
        blurView.frame.size = CGSize(width: frame.width, height: frame.height)
        var hintView = ATHHintView(frame: CGRect(x: 30.0, y: 150.0, width: (SCREEN_WIDTH-60.0), height: (SCREEN_HEIGHT-300)), word1: "suburb", word2: "subtle")
        VIEWBORDER(view: hintView, color: BTN_BACKGROUND_COLOR, width: 3.0)
        blurView.addSubview(hintView)
        super.init(frame: frame)
        self.addSubview(blurView)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
   }
