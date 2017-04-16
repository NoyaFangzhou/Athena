//
//  ATHMacro.swift
//  AthenaUI
//
//  Created by Fangzhou Liu on 17/4/12.
//  Copyright © 2017年 Fangzhou Liu. All rights reserved.
//

import UIKit

// Constant Value

let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

let KEYBOARD_HEIGHT = 216.0
let STATUS_BAR_HEIGHT = 20.0

let NAVIGATION_BAR_HEIGHT = 44.0

// background color for the Sign In, Sign Up and Next
let BTN_BACKGROUND_COLOR = RGBCOLOR(0, 239, 181)

// background color for the button that was clicked
let BTN_BACKGROUND_COLOR_CLICKED = RGBCOLOR(0, 220, 161)

// placeholder text color
let PLACEHOLDER_COLOR = RGBCOLOR(161, 160, 182)

// line color
let BOTTOM_LINE_COLOR = RGBCOLOR(41, 41, 67)

// textview background color for the user input
let TEXTVIEW_BACKGROUND_COLOR = RGBCOLOR(44, 43, 73)

// text color for poor pronounce words
let WRONG_WORD_COLOR = RGBCOLOR(226, 0, 72)

// color for the green border
let GREEN_BORDER_COLOR = RGBCOLOR(49, 158, 131)

// color for the hint view
let PRACTICE_WORD_COLOR = RGBCOLOR(218, 219, 221)

// type defined for the input
enum ATHInputStyle: Int {
    case ATHNormal = 0
    case ATHEmail = 1
    case ATHPassword = 2
    case ATHPhone = 3
    case ATHLanguage = 4
    case ATHGender = 5
}

enum ATHHeaderItemType: Int {
    case ATHReturn = 0
    case ATHMenu = 1
    case ATHNULL = 2
}

enum ATHImageName: String {
    case ATHMicrophone_EN = "mic-en.png"
    case ATHMicrophone_DIS = "mic-dis.png"
    case ATHVolume = "volume.png"
    case ATHPlay = "play.png"
    case ATHReturn = "back.png"
    case ATHMenu = "menu.png"
    case ATHBackGround = "Background.png"
    case ATHOKHand = "OK_hand.png"
    case ATHHappyFace = "happy_face.png"
    case ATHNeutralFace = "eutral_face.png"
    case ATHSadFace = "sad_face.png"
}

let GENDER_SET = ["Male", "Female", "Other"]

let LANGUAGE_SET = ["Afrikaans",
                 "Albanian",
                 "Arabic",
                 "Azerbaijani",
                 "Basque",
                 "Bengali",
                 "Belarusian",
                 "Bulgarian",
                 "Catalan",
                 "Chinese",
                 "Croatian",
                 "Czech",
                 "Danish",
                 "Dutch",
                 "English",
                 "Estonian",
                 "Filipino",
                 "Finnish",
                 "French",
                 "Galician",
                 "Georgian",
                 "German",
                 "Greek",
                 "Gujarati",
                 "Haitian Creole",
                 "Hebrew",
                 "Hindi",
                 "Hungarian",
                 "Icelandic",
                 "Indonesian",
                 "Irish",
                 "Italian",
                 "Japanese",
                 "Kannada",
                 "Korean",
                 "Latvian",
                 "Lithuanian",
                 "Macedonian",
                 "Malay",
                 "Maltese",
                 "Norwegian",
                 "Persian",
                 "Polish",
                 "Portuguese",
                 "Romanian",
                 "Russian",
                 "Serbian",
                 "Slovak",
                 "Slovenian",
                 "Spanish",
                 "Swahili",
                 "Swedish",
                 "Tamil",
                 "Telugu",
                 "Thai",
                 "Turkish",
                 "Ukrainian",
                 "Urdu",
                 "Vietnamese",
                 "Welsh",
                 "Yiddish"]

// RGB
func RGBCOLOR(_ r:CGFloat,_ g:CGFloat,_ b:CGFloat) -> UIColor {
    return UIColor(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: 1.0)
}

// Add Border on view
func VIEWBORDER(view: UIView, color: UIColor, width: Float) {
    view.layer.borderColor = color.cgColor
    view.layer.borderWidth = CGFloat(width)
}

// Draw a line on view
func ADDLINE(view: UIView, color: UIColor, width: CGFloat) {
    print("Add line from Point(0.0, \(view.y+view.height-width)) to Point(\(view.width, view.y+view.height-width))")
    //1.获取上下文
    let context = UIGraphicsGetCurrentContext();
    //2.设置当前上下问路径
    //设置起始点
    context?.move(to: CGPoint(x: 0.0, y: view.height-width))
    //增加点
    context?.addLine(to: CGPoint(x: view.width, y: view.height-width))
    //关闭路径
    context?.closePath()
    //3.设置属性
    /*
     UIKit会默认导入 core Graphics框架，UIKit对常用的很多的唱歌方法做了封装
     UIColor setStroke设置边线颜色
     uicolor setFill 设置填充颜色
     
     */
    color.setStroke()
    color.setFill()
    //4.绘制路径
    context?.drawPath(using: .fillStroke)
   
}

// Extension

extension CGRect {
    
    var x: CGFloat {
        return self.origin.x
    }
    
    var y: CGFloat {
        return self.origin.y
    }
    
    var width: CGFloat {
        return self.size.width
    }
    
    var height: CGFloat {
        return self.size.height
    }
}

extension UIView {
    
    var x: CGFloat {
        return self.frame.origin.x
    }
    
    var y: CGFloat {
        return self.frame.origin.y
    }
    
    var width: CGFloat {
        return self.frame.size.width
    }
    
    var height: CGFloat {
        return self.frame.size.height
    }
}

