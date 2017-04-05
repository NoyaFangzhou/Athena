//
//  main.swift
//  AudioEvaluationApp
//
//  Created by Fangzhou Liu on 17/4/4.
//  Copyright © 2017年 Fangzhou Liu. All rights reserved.
//

import Foundation

var brain = EvaluationBrain()

var test = "Thesis god"

var standard = "This is good"

var score = brain.calSimilarity(test: test, standard: standard)

print("The similarity between \(test) and \(standard) is \(score)")

