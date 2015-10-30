//
//  Knobb.swift
//  KnobDemo
//
//  Created by Karsten Gresch on 29.10.15.
//  Copyright © 2015 Mikael Konutgan. All rights reserved.
//

import UIKit

public class Knob: UIControl {
  private var backingValue: Float = 0.0
  
  
  public var value: Float {
    get { return backingValue }
    set { setValue(newValue, animated: false) }
  }
  
  public func setValue(value: Float, animated: Bool) {
    if value != backingValue {
      backingValue = min(maximumValue, max(minimumValue, value))
    }
  }
  
  /** */
  public var minimumValue: Float = 0.0
  /** */
  public var maximumValue: Float = 1.0
  /** */
  public var continuous: Bool = true
  

  public override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = tintColor
    
  }
  
  public required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented!")
  }


}

private class KnobRenderer {
  var lineWidth: CGFloat = 1.0
  
  let trackLayer = CAShapeLayer()
  var startAngle: CGFloat = 0.0
  var endAngle: CGFloat = 0.0
  
  let pointerLayer = CAShapeLayer()
  var pointerLength: CGFloat = 0.0
  var backingPointerAngle: CGFloat = 0.0
  
  
  var pointerAngle: CGFloat {
    get { return backingPointerAngle }
    set { setPointerAngle(newValue, animated: false) }
  }
  
  func setPointerAngle(pointerAngle: CGFloat, animated: Bool) {
    self.backingPointerAngle = pointerAngle
  }
  
  var strokeColor: UIColor {
    get {
      return UIColor(CGColor: trackLayer.strokeColor!)
    }
    
    set(strokeColor) {
      trackLayer.strokeColor = strokeColor.CGColor
      pointerLayer.strokeColor = strokeColor.CGColor
    }
  }
  
  
  
  
  
  
  
}
