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
  
  @IBInspectable var fillColor: UIColor = UIColor.red
  @IBInspectable var isAddButton: Bool = true
  

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
  
  override func draw(_ rect: CGRect) {
    let path = UIBezierPath(ovalIn: rect)
    fillColor.setFill()
    path.fill()
    // line thickness
    let plusHeight: CGFloat = 0.7
    // line length
    let plusWidth: CGFloat = min(bounds.width, bounds.height) * 0.74
    
    let plusPath = UIBezierPath()
    plusPath.lineWidth = plusHeight
    plusPath.move(to: CGPoint(x: bounds.width/2 - plusWidth/2 + 0.5, y: bounds.height/2 + 0.5))
    
    plusPath.addLine(to: CGPoint(x: bounds.width/2 + plusWidth/2 + 0.5, y: bounds.height/2 + 0.5))


    
    if isAddButton {
      //move to the start of the vertical stroke
      plusPath.move(to: CGPoint(
        x:bounds.width/2 + 0.5,
        y:bounds.height/2 - plusWidth/2 + 0.5))
      
      //add the end point to the vertical stroke
      plusPath.addLine(to: CGPoint(
        x:bounds.width/2 + 0.5,
        y:bounds.height/2 + plusWidth/2 + 0.5))
      
    }
    
    UIColor.white.setStroke()
    plusPath.stroke()
    
  }

}
