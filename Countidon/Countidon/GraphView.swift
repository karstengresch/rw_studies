//
//  GraphView.swift
//  Countidon
//
//  Created by Karsten Gresch on 23.09.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit

@IBDesignable
class GraphView: UIButton {
  
  @IBInspectable var startColor: UIColor = UIColor.redColor()
  @IBInspectable var endColor: UIColor = UIColor.greenColor()
  

    override func drawRect(rect: CGRect) {
        // Drawing code
      
      let context = UIGraphicsGetCurrentContext()
      let colors = [startColor.CGColor, endColor.CGColor]
      let colorSpace = CGColorSpaceCreateDeviceRGB()
      
      let colorLocations: [CGFloat] = [0.0, 1.0]
      
      let gradient = CGGradientCreateWithColors(colorSpace, colors, colorLocations)
      let startPoint = CGPoint.zero
      let endPoint = CGPoint(x: 0, y: self.bounds.height)
      
      CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, CGGradientDrawingOptions())
      
      
    }


}
