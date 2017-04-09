//
//  NPTuple.swift
//  AudioEvaluationApp
//
//  Created by Fangzhou Liu on 17/4/8.
//  Copyright © 2017年 Fangzhou Liu. All rights reserved.
//

import Foundation


class NPTuple {
    
    var correct: String
    var inaccur: String = ""
    var score: Double = 0.0
    
    /* Custom constructor of NPTuple */
    init(lib: String, test: String, score: Double) {
        self.correct = lib
        self.inaccur = test
        self.score = score
    }
    
    
    /* Display the tuple's information */
    func toString() -> String {
        return "Expected: \(self.correct)\nActual: \(self.inaccur)\nScore: \(self.score)"
    }
    
    /* Return a boolean indicates whether his NPTuple has two strings to be compared */
    func needCompare() -> Bool {
        return (self.inaccur.isEmpty && !self.correct.isEmpty) || (!self.inaccur.isEmpty && self.correct.isEmpty)
    }
    
    
}
