//
//  EvaluationBrain.swift
//  AudioEvaluationApp
//
//  Created by Fangzhou Liu on 17/4/4.
//  Copyright © 2017年 Fangzhou Liu. All rights reserved.
//
//  Reference:
//  [1] Parts of the String Extension library comes from http://stackoverflow.com/questions/24092884/get-nth-character-of-a-string-in-swift-programming-language
//

import Foundation

class EvaluationBrain {
    
    /**
     *
     * Calculate the similarity of two strings based on their distance
     * @para test: 		string to be meaturered
     * @para standard:  standard string
     * @return: 		a float value indicates the similiarity rate
     */
    func calSimilarity(test: String, standard: String) -> Double {
        // test is null
        if test.isEmpty {
            return 0.0
        }
        
        var google = test.lowercased()
        var user = standard.lowercased().rmpunctuation
        print ("google: \(google)\n")
        print ("user: \(user)\n")

        return 1.0 - Double(calDistance(str: google, lib: user))/Double(user.length)
    }
    
    
    /**
     *
     * Calculate the distance between two strings
     * Smaller distance means that the two strings looks similar
     *
     * @para str: 	string to be tested
     * @para lib: 	standard str
     * @return  : 	double variable, the similarity between two strings
     */
    func calDistance(str: String, lib: String) -> Int {
        // get the string length of two stirngs
        let str_len = str.length
        let lib_len = lib.length-1
        
        if str_len == 0 {
            return lib_len
        }
        
        // create a array with size strlen+1 * liblen+1
        var distArr = Array(repeating: Array(repeating: 0, count: lib_len+1), count: str_len+1)
        
        for i in 0 ..< str_len {
            distArr[i][0] = i
        }
        
        for j in 0 ..< lib_len {
            distArr[0][j] = j
        }
        
        var eq = 0
        
        var strChar, libChar: Character
        
        for i in 1 ... str_len {
            strChar = Character(str[i-1])
            for j in 1 ... lib_len {
                libChar = Character(lib[j-1])
                if (strChar == libChar) {
                    eq = 0
                }
                else {
                    eq = 1
                }
                distArr[i][j] = min(distArr[i-1][j-1]+eq, min(distArr[i][j-1]+1, distArr[i-1][j]+1));
            }
        }
        return distArr[str_len][lib_len];
    }
}


extension String {
    
    var length: Int {
        return self.characters.count
    }
    
    subscript (i: Int) -> String {
        return self[Range(i ..< i + 1)]
    }
    
    func substring(from: Int) -> String {
        return self[Range(min(from, length) ..< length)]
    }
    
    func substring(to: Int) -> String {
        return self[Range(0 ..< max(0, to))]
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return self[Range(start ..< end)]
    }
    
    // clear all the extra space character in the string
    func rmspace(string: String) -> String {
        let result = string.components(separatedBy: NSCharacterSet.whitespaces)
        return result.joined()
        
    }
    // clear all punctuations
    var rmpunctuation:  String {
        let strArr = self.components(separatedBy: NSCharacterSet.whitespaces)
        var result = ""
        strArr.forEach{ (str) in
            var temp = str.components(separatedBy: NSCharacterSet.punctuationCharacters)
            temp = temp.filter( {!$0.isEmpty} )
            result += temp[0] + " "
        }

        return result
    }
    
}
