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
  
  var graphPoints: [Int] = [4,2,6,8,3,5,2]
  

    override func drawRect(rect: CGRect) {

      let width = rect.width
      let height = rect.height
      
      var path = UIBezierPath(roundedRect: rect, byRoundingCorners: UIRectCorner.AllCorners, cornerRadii: CGSize(width: 8.0, height: 8.0))
      path.addClip()
      
      let context = UIGraphicsGetCurrentContext()
      let colors = [startColor.CGColor, endColor.CGColor]
      let colorSpace = CGColorSpaceCreateDeviceRGB()
      
      let colorLocations: [CGFloat] = [0.0, 1.0]
      
      let gradient = CGGradientCreateWithColors(colorSpace, colors, colorLocations)
      let startPoint = CGPoint.zero
      let endPoint = CGPoint(x: 0, y: self.bounds.height)
      
      CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, CGGradientDrawingOptions())
      // x-point calculation
      let margin: CGFloat = 20.0
      var columnXPoint = { (column:Int)->CGFloat in
        // gap between points
        let spacer = (width - margin*2 - 4) / CGFloat((self.graphPoints.count - 1))
        var xValue:CGFloat = CGFloat(column) * spacer
        xValue += margin + 2
        return xValue
      }
      // y-point calculation
      let topBorder: CGFloat = 60
      let bottomBorder: CGFloat = 60
      let graphHeight = height - topBorder - bottomBorder
      var columnYPoint = { (graphPoint: Int) -> CGFloat in
        var yValue: CGFloat = CGFloat(0)
        if let maxValue = self.graphPoints.maxElement()
        {
        var yValue: CGFloat = CGFloat(graphPoint) / CGFloat(maxValue) * graphHeight
        yValue = graphHeight + topBorder - yValue
        }
        return yValue
        
      
      }
      
      
  }
}
