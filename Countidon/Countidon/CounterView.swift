//
//  CounterView.swift
//  Countidon
//
//  Created by Karsten Gresch on 19.09.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit

@IBDesignable
class CounterView: UIButton {
  
  @IBInspectable var counter: Int = 5
  @IBInspectable var outlineColor: UIColor = UIColor.blueColor()
  @IBInspectable var counterColor: UIColor = UIColor.orangeColor()

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    */
override func drawRect(rect: CGRect) {
      
    }


}
