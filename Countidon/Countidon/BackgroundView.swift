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
      // NB - don't confuse w/ CGContextSetFillColor - UnsafePointer stuff'd b ur rewards
      CGContextSetFillColorWithColor(context, darkColor.CGColor)
      CGContextFillRect(context, rect)
      // pattern
      let drawSize = CGSize(width: patternSize, height: patternSize)
      let trianglePath = UIBezierPath()
      
      trianglePath.moveToPoint(CGPoint(x: drawSize.width/2, y: 0))
      trianglePath.addLineToPoint(CGPoint(x: 0, y: drawSize.height/2))
      trianglePath.addLineToPoint(CGPoint(x: drawSize.width, y: drawSize.height/2))
      
      trianglePath.moveToPoint(CGPoint(x: 0, y: drawSize.height/2))
      trianglePath.addLineToPoint(CGPoint(x: drawSize.width/2, y: drawSize.height))
      trianglePath.addLineToPoint(CGPoint(x: 0, y: drawSize.height))
      
      trianglePath.moveToPoint(CGPoint(x: drawSize.width, y: drawSize.height/2))
      trianglePath.addLineToPoint(CGPoint(x: drawSize.width/2, y: drawSize.height))
      trianglePath.addLineToPoint(CGPoint(x: drawSize.width, y: drawSize.height))
      
      lightColor.setFill()
      trianglePath.fill()

    }


}
