//
//  ATHHintView.swift
//  AthenaUI
//
//  Created by Fangzhou Liu on 17/4/14.
//  Copyright © 2017年 Fangzhou Liu. All rights reserved.
//

import UIKit
protocol ATHHintViewDelegate {
    func playAudio(word: String)
    func addHistory(word1: String, word2: String)
}
class ATHHintView: ATHBackgroundView {
    
//    var delegate = ATHHintViewDelegate!
    
    init(frame: CGRect, word1: String, word2: String) {
        
        super.init(frame: frame)
        var w1 =  ATHLabel(frame: CGRect(x: 0.0, y: 30.0, width: (frame.width-50)/2, height: 30), text: word1, color: PRACTICE_WORD_COLOR, size: 20)
        var w2 =  ATHLabel(frame: CGRect(x: w1.width+50, y: 30.0, width: (frame.width-50)/2, height: 30), text: word2, color: PRACTICE_WORD_COLOR, size: 20)
        let vs = ATHLabel(frame: CGRect(x: w1.width, y: (w1.y+w1.height)/2, width: 50, height: 50.0), text: "vs", color: BTN_BACKGROUND_COLOR, size: 30.0)
        var p1 =  ATHLabel(frame: CGRect(x: 0.0, y: w2.y+w2.height+10, width: (frame.width-50)/2, height: 30), text: word1, color: PRACTICE_WORD_COLOR, size: 20)
        var p2 =  ATHLabel(frame: CGRect(x: w1.width+50, y: w2.y+w2.height+10, width: (frame.width-50)/2, height: 30), text: word2, color: PRACTICE_WORD_COLOR, size: 20)

        self.addSubview(w1)
        self.addSubview(w2)
        self.addSubview(vs)
        self.addSubview(p1)
        self.addSubview(p2)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
