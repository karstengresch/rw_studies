//
//  RoundedView.swift
//  RWBooks
//
//  Created by Karsten Gresch on 11.10.15.
//  Copyright © 2015 Razeware LLC. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedView: UIView {
  
  
  override func layoutSubviews() {
    let shapeLayer = CAShapeLayer()
    shapeLayer.path = UIBezierPath(roundedRect: bounds, byRoundingCorners: [UIRectCorner.TopLeft,  UIRectCorner.TopRight], cornerRadii: CGSize(width: 30, height: 30)).CGPath
    
    layer.mask = shapeLayer
  }
  
}
