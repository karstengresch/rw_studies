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
  @IBInspectable var outlineColor: UIColor = UIColor.blue
  @IBInspectable var counterColor: UIColor = UIColor.orange
  
  /*
  // Only override drawRect: if you perform custom drawing.
  // An empty implementation adversely affects performance during animation.
  */
  override func draw(_ rect: CGRect) {
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
    outlinePath.addArc(withCenter: center, radius: bounds.width/2 - arcWidth*1.69 + 2.5, startAngle: outlineEndAngle, endAngle: startAngle, clockwise: false)
    
    outlinePath.close()
    outlineColor.setStroke()
    outlinePath.lineWidth = 2.0
    outlinePath.stroke()
    
    // glasses drunken markers
    let context = UIGraphicsGetCurrentContext()
    // 1 save state
    context?.saveGState()
    outlineColor.setFill()
    
    let markerWidth: CGFloat = 5.0
    let markerSize: CGFloat = 10.0
    
    // marker top left
    let markerPath = UIBezierPath(rect: CGRect(x: -markerWidth/2, y: -10.5*π, width: markerWidth, height: markerSize))
    context?.translateBy(x: rect.width/2, y: rect.height/2)
    
    for i in 1...NumberOfGlasses {
      context?.saveGState()
      let angle = arcLengthPerGlass * CGFloat(i) + startAngle - π/2
      context?.rotate(by: angle)
      context?.translateBy(x: 0, y: rect.height/2 - markerSize)
      markerPath.fill()
      context?.restoreGState()
    }
    
      context?.restoreGState()
    
    
  }
  
  
}
