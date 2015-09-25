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
      
      let path = UIBezierPath(roundedRect: rect, byRoundingCorners: UIRectCorner.AllCorners, cornerRadii: CGSize(width: 8.0, height: 8.0))
      path.addClip()
      
      let context = UIGraphicsGetCurrentContext()
      let colors = [startColor.CGColor, endColor.CGColor]
      let colorSpace = CGColorSpaceCreateDeviceRGB()
      
      let colorLocations: [CGFloat] = [0.0, 1.0]
      
      let gradient = CGGradientCreateWithColors(colorSpace, colors, colorLocations)
      var startPoint = CGPoint.zero
      var endPoint = CGPoint(x: 0, y: self.bounds.height)
      
      CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, CGGradientDrawingOptions())
      
      // x-point calculation
      let margin: CGFloat = 20.0
      let columnXPoint =
      {
        (column:Int)->CGFloat in
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
      let maxValue = self.graphPoints.maxElement()!
      
      let columnYPoint =
      { (graphPoint: Int) -> CGFloat in
        print("Max element: \(self.graphPoints.maxElement())")
          var yValue: CGFloat = CGFloat(graphPoint) / CGFloat(maxValue) * graphHeight
          yValue = graphHeight + topBorder - yValue
          return yValue
        }
      
      
      UIColor.whiteColor().setFill()
      UIColor.whiteColor().setStroke()
      
      let graphPath = UIBezierPath()
      
      graphPath.moveToPoint(CGPoint(x: columnXPoint(0), y: columnYPoint(graphPoints[0])))
      
      for i in 1..<graphPoints.count {
          let nextPoint = CGPoint(x: columnXPoint(i), y: columnYPoint(graphPoints[i]))
          graphPath.addLineToPoint(nextPoint)
      }
      
      // graphPath.stroke()
      
      // clipping path for graph 
      CGContextSaveGState(context)
      
      let clippingPath = graphPath.copy() as! UIBezierPath
      clippingPath.addLineToPoint(CGPoint(x: columnXPoint(graphPoints.count - 1), y: height))
      clippingPath.addLineToPoint(CGPoint(x: columnXPoint(0), y: height))
      clippingPath.closePath()
      clippingPath.addClip()
      // Add gradient to area below the value line
      let highestYPoint = columnYPoint(maxValue)
      startPoint = CGPoint(x: margin, y: highestYPoint)
      endPoint = CGPoint(x: margin, y: self.bounds.height)
      CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, CGGradientDrawingOptions())
      CGContextRestoreGState(context)
      graphPath.lineWidth = 2.0
      graphPath.stroke()
      // add value circles on the progress line
      for i in 0..<graphPoints.count {
        var point = CGPoint(x: columnXPoint(i), y: columnYPoint(graphPoints[i]))
        point.x -= 5.0/2
        point.y -= 5.0/2
        
        let circle = UIBezierPath(ovalInRect: CGRect(origin: point, size: CGSize(width: 5.0, height: 5.0)))
        circle.fill()
      }
      
      let linePath = UIBezierPath()
      
      // top line
      linePath.moveToPoint(CGPoint(x: margin, y: topBorder))
      linePath.addLineToPoint(CGPoint(x: width - margin, y: topBorder))
      // center line
      linePath.moveToPoint(CGPoint(x: margin, y: graphHeight / 2 + topBorder))
      linePath.addLineToPoint(CGPoint(x: width - margin, y: graphHeight / 2 + topBorder))
      //bottom line
      linePath.moveToPoint(CGPoint(x: margin, y: height - bottomBorder))
      linePath.addLineToPoint(CGPoint(x: width - margin, y: height - bottomBorder))
      let color = UIColor(white: 1.0, alpha: 0.3)
      color.setStroke()
      linePath.lineWidth = 1.0
      linePath.stroke()
  }
}
