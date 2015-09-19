//
//  PushButtonView.swift
//  Countidon
//
//  Created by Karsten Gresch on 18.09.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit

@IBDesignable
class PushButtonView: UIButton {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
  
  override func drawRect(rect: CGRect) {
    let path = UIBezierPath(ovalInRect: rect)
    UIColor.redColor().setFill()
    path.fill()
    // line thickness
    let plusHeight: CGFloat = 0.7
    // line length
    let plusWidth: CGFloat = min(bounds.width, bounds.height) * 0.74
    
    let plusPath = UIBezierPath()
    plusPath.lineWidth = plusHeight
    plusPath.moveToPoint(CGPoint(x: bounds.width/2 - plusWidth/2 + 0.5, y: bounds.height/2 + 0.5))
    
    plusPath.addLineToPoint(CGPoint(x: bounds.width/2 + plusWidth/2 + 0.5, y: bounds.height/2 + 0.5))

    //move to the start of the vertical stroke
    plusPath.moveToPoint(CGPoint(
      x:bounds.width/2 + 0.5,
      y:bounds.height/2 - plusWidth/2 + 0.5))
    
    //add the end point to the vertical stroke
    plusPath.addLineToPoint(CGPoint(
      x:bounds.width/2 + 0.5,
      y:bounds.height/2 + plusWidth/2 + 0.5))
    
    UIColor.whiteColor().setStroke()
    plusPath.stroke()
    
  }

}
