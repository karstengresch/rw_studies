//
//  BackgroundView.swift
//  Countidon
//
//  Created by Karsten Gresch on 29.09.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit

@IBDesignable

class BackgroundView: UIView {

  @IBInspectable var lightColor: UIColor = UIColor.orangeColor()
  @IBInspectable var darkColor: UIColor = UIColor.darkGrayColor()
  @IBInspectable var patternSize: CGFloat = 200
  
  
    override func drawRect(rect: CGRect) {
      let context = UIGraphicsGetCurrentContext()
      
      CGContextSetFillColorWithColor(context, darkColor.CGColor)
      CGContextFillRect(context, rect)

    }


}
