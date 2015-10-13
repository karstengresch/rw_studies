//
//  OvalLayer.swift
//  SBLoader
//
//  Created by Satraj Bambra on 2015-03-19.
//  Copyright (c) 2015 Satraj Bambra. All rights reserved.
//

import UIKit

class OvalLayer: CAShapeLayer {
  
  let animationDuration: CFTimeInterval = 0.3
  
  override init!() {
    super.init()
    fillColor = Colors.red.CGColor
    path = ovalPathSmall.CGPath
  }
  
  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  var ovalPathSmall: UIBezierPath {
    return UIBezierPath(ovalInRect: CGRect(x: 50.0, y: 50.0, width: 0.0, height: 0.0))
  }
  
  var ovalPathLarge: UIBezierPath {
    return UIBezierPath(ovalInRect: CGRect(x: 2.5, y: 17.5, width: 95.0, height: 95.0))
  }
  
  var ovalPathSquishVertical: UIBezierPath {
    return UIBezierPath(ovalInRect: CGRect(x: 2.5, y: 20.0, width: 95.0, height: 90.0))
  }
  
  var ovalPathSquishHorizontal: UIBezierPath {
    return UIBezierPath(ovalInRect: CGRect(x: 5.0, y: 20.0, width: 90.0, height: 90.0))
  }
  
  func expand() {
    
  }
  
  func wobble() {
    
  }
  
  func contract() {
    
  }
}
