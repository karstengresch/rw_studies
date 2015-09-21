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
  
  @IBInspectable var counter: Int = 5
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
  let arcWidth: CGFloat = 56
  let startAngle: CGFloat = 3 * π / 4
  let endAngle: CGFloat = π / 4
  
  let path = UIBezierPath(arcCenter: center, radius: radius/2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
  
  path.lineWidth = arcWidth
  counterColor.setStroke()
  path.stroke()
  
      
    }


}
