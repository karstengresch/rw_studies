//
//  HolderView.swift
//  SBLoader
//
//  Created by Satraj Bambra on 2015-03-17.
//  Copyright (c) 2015 Satraj Bambra. All rights reserved.
//

import UIKit

protocol HolderViewDelegate:class {
  func animateLabel()
}

class HolderView: UIView {

  let ovalLayer = OvalLayer()
  
  var parentFrame :CGRect = CGRectZero
  weak var delegate:HolderViewDelegate?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = Colors.clear
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  func addOval() {
    layer.addSublayer(ovalLayer)
    ovalLayer.expand()
    NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: "wobbleOval", userInfo: nil, repeats: false)
    
    
  }
  
  func wobbleOval() {
    ovalLayer.wobble()
  }
  
}
