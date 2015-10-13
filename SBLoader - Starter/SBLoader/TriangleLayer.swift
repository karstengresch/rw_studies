//
//  TriangleLayer.swift
//  SBLoader
//
//  Created by Satraj Bambra on 2015-03-19.
//  Copyright (c) 2015 Satraj Bambra. All rights reserved.
//

import UIKit

class TriangleLayer: CAShapeLayer {
  
  let innerPadding: CGFloat = 30.0
  
  override init!() {
    super.init()
    fillColor = Colors.red.CGColor
    strokeColor = Colors.red.CGColor
    lineWidth = 7.0
    lineCap = kCALineCapRound
    lineJoin = kCALineJoinRound
    path = trianglePathSmall.CGPath
  }
  
  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  var trianglePathSmall: UIBezierPath {
    var trianglePath = UIBezierPath()
    trianglePath.moveToPoint(CGPoint(x: 5.0 + innerPadding, y: 95.0))
    trianglePath.addLineToPoint(CGPoint(x: 50.0, y: 12.5 + innerPadding))
    trianglePath.addLineToPoint(CGPoint(x: 95.0 - innerPadding, y: 95.0))
    trianglePath.closePath()
    return trianglePath
  }
  
  var trianglePathLeftExtension: UIBezierPath {
    var trianglePath = UIBezierPath()
    trianglePath.moveToPoint(CGPoint(x: 5.0, y: 95.0))
    trianglePath.addLineToPoint(CGPoint(x: 50.0, y: 12.5 + innerPadding))
    trianglePath.addLineToPoint(CGPoint(x: 95.0 - innerPadding, y: 95.0))
    trianglePath.closePath()
    return trianglePath
  }
  
  var trianglePathRightExtension: UIBezierPath {
    var trianglePath = UIBezierPath()
    trianglePath.moveToPoint(CGPoint(x: 5.0, y: 95.0))
    trianglePath.addLineToPoint(CGPoint(x: 50.0, y: 12.5 + innerPadding))
    trianglePath.addLineToPoint(CGPoint(x: 95.0, y: 95.0))
    trianglePath.closePath()
    return trianglePath
  }
  
  var trianglePathTopExtension: UIBezierPath {
    var trianglePath = UIBezierPath()
    trianglePath.moveToPoint(CGPoint(x: 5.0, y: 95.0))
    trianglePath.addLineToPoint(CGPoint(x: 50.0, y: 12.5))
    trianglePath.addLineToPoint(CGPoint(x: 95.0, y: 95.0))
    trianglePath.closePath()
    return trianglePath
  }
  
  func animate() {
    
  }
}
