//
//  ATHHeadView.swift
//  AthenaUI
//
//  Created by Fangzhou Liu on 17/4/13.
//  Copyright © 2017年 Fangzhou Liu. All rights reserved.
//

import UIKit

class ATHHeadView: UIView {
    
    var leftItem:   UIButton
    var rightItem:  UIButton
    var title:      UILabel
    
    
    init(frame: CGRect, title: String, left: ATHHeaderItemType, right: ATHHeaderItemType) {
        
        self.leftItem = UIButton(frame: CGRect(x: 5, y: 2, width: 40, height: 40))
        
        self.title = UILabel(frame: CGRect(x: self.leftItem.x+self.leftItem.width+5, y: self.leftItem.y, width: (frame.width-2*self.leftItem.width-20), height: self.leftItem.height))
        
        self.rightItem = UIButton(frame: CGRect(x: self.title.width+self.leftItem.width+15, y: 2, width: 40, height: 40))
        
        super.init(frame: frame)
        
        switch left {
        case ATHHeaderItemType.ATHReturn:
            self.leftItem.setImage(UIImage.init(imageLiteralResourceName: ATHImageName.ATHReturn.rawValue), for: UIControlState.normal)
            self.addSubview(leftItem)
            break
        case ATHHeaderItemType.ATHMenu:
            self.leftItem.setImage(UIImage.init(imageLiteralResourceName: ATHImageName.ATHMenu.rawValue), for: UIControlState.normal)
            self.addSubview(leftItem)
            break
        default:
            // do nothing
            break;
        }
        
        switch right {
        case ATHHeaderItemType.ATHReturn:
            self.rightItem.setImage(UIImage.init(imageLiteralResourceName: ATHImageName.ATHReturn.rawValue), for: UIControlState.normal)
            self.addSubview(rightItem)
            break
        case ATHHeaderItemType.ATHMenu:
            self.rightItem.setImage(UIImage.init(imageLiteralResourceName: ATHImageName.ATHMenu.rawValue), for: UIControlState.normal)
            self.addSubview(rightItem)
            break
        default:
            
            // do nothing
            break;
        }
        
        self.title.text = title
        self.title.textAlignment = NSTextAlignment.center
        self.title.textColor = UIColor.white
        VIEWBORDER(view: self.title, color: UIColor.orange, width: 2.0)
        self.addSubview(self.title)

        
        
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
