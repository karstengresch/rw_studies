//
//  CounterView.swift
//  Countidon
//
//  Created by Karsten Gresch on 19.09.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit

let NumberOfGlasses = 8
let π: CGFloat = CGFloat(M_PI)

@IBDesignable
class CounterView: UIView {
  
  @IBInspectable var counter: Int = 0 {
    didSet {
      if counter <= NumberOfGlasses {
        setNeedsDisplay()
      }
    }
    
  }
  @IBInspectable var outlineColor: UIColor = UIColor.blueColor()
  @IBInspectable var counterColor: UIColor = UIColor.orangeColor()
  
  /*
  // Only override drawRect: if you perform custom drawing.
  // An empty implementation adversely affects performance during animation.
  */
  override func drawRect(rect: CGRect) {
    // center
    let center = CGPoint(x: bounds.width/2, y: bounds.height/2)
    let radius: CGFloat = max(bounds.width/2, bounds.height/2)
    let arcWidth: CGFloat = 50
    let startAngle: CGFloat = 3 * π / 4
    let endAngle: CGFloat = π / 4
    
    let path = UIBezierPath(arcCenter: center, radius: radius/2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
    
    path.lineWidth = arcWidth
    counterColor.setStroke()
    path.stroke()
    
    // Outline
    let angleDifference: CGFloat = 2 * π - startAngle + endAngle
    let arcLengthPerGlass = angleDifference / CGFloat(NumberOfGlasses)
    let outlineEndAngle = arcLengthPerGlass * CGFloat(counter) + startAngle
    
    let outlinePath = UIBezierPath(arcCenter: center, radius: bounds.width/2.79, startAngle: startAngle, endAngle: outlineEndAngle, clockwise: true)
    outlinePath.addArcWithCenter(center, radius: bounds.width/2 - arcWidth*1.69 + 2.5, startAngle: outlineEndAngle, endAngle: startAngle, clockwise: false)
    
    outlinePath.closePath()
    outlineColor.setStroke()
    outlinePath.lineWidth = 2.0
    outlinePath.stroke()
    
    // glasses drunken markers
    let context = UIGraphicsGetCurrentContext()
    // 1 save state
    CGContextSaveGState(context)
    outlineColor.setFill()
    
    let markerWidth: CGFloat = 5.0
    let markerSize: CGFloat = 10.0
    
    // marker top left
    let markerPath = UIBezierPath(rect: CGRect(x: -markerWidth/2, y: -10.5*π, width: markerWidth, height: markerSize))
    CGContextTranslateCTM(context, rect.width/2, rect.height/2)
    
    for i in 1...NumberOfGlasses {
      CGContextSaveGState(context)
      let angle = arcLengthPerGlass * CGFloat(i) + startAngle - π/2
      CGContextRotateCTM(context, angle)
      CGContextTranslateCTM(context, 0, rect.height/2 - markerSize)
      markerPath.fill()
      CGContextRestoreGState(context)
    }
    
      CGContextRestoreGState(context)
    
    
  }
  
  
}
