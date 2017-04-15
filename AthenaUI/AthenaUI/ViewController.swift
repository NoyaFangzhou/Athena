//
//  ViewController.swift
//  AthenaUI
//
//  Created by Fangzhou Liu on 17/4/12.
//  Copyright © 2017年 Fangzhou Liu. All rights reserved.
//

import UIKit

class ViewController: ATHBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let bv = ATHBlurView(frame: CGRect(x: 0.0, y: 0.0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        super.viewDidLoad()
        
        
        var header = ATHHeadView(frame: CGRect(x: 0.0, y: STATUS_BAR_HEIGHT, width: Double(SCREEN_WIDTH), height: NAVIGATION_BAR_HEIGHT), title: "", left: ATHHeaderItemType.ATHReturn, right: ATHHeaderItemType.ATHMenu)
        self.view.addSubview(header)
        
        var textInput = ATHTextView(frame: CGRect(x: 35.0, y: Double(header.y+header.height)+30.0, width: Double(SCREEN_WIDTH-60.0), height: 400), placeholder: "Type the text you want to practice")
        //        VIEWBORDER(view: textInput, color: UIColor.red, width: 2.0)
        self.view.addSubview(textInput)
        
        var playButton = ATHRoundButton(frame: CGRect(x: (SCREEN_WIDTH-240.0)/2, y: textInput.y+textInput.height+30.0, width: 90.0, height: 90.0), image: UIImage(named: ATHImageName.ATHPlay.rawValue)!, selected: BTN_BACKGROUND_COLOR)
        //        VIEWBORDER(view: playButton, color: BTN_BACKGROUND_COLOR, width: 5.0)
        self.view.addSubview(playButton)
        var recordButton = ATHRoundButton(frame: CGRect(x: playButton.x+playButton.width+50.0, y: textInput.y+textInput.height+30.0, width: 90.0, height: 90.0), image: UIImage(named: ATHImageName.ATHMicrophone_EN.rawValue)!, selected: BTN_BACKGROUND_COLOR)
        VIEWBORDER(view: recordButton, color: BTN_BACKGROUND_COLOR, width: 5.0)
        self.view.addSubview(recordButton)
        self.view.addSubview(bv)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

