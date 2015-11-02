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
  
  private let knobRenderer = KnobRenderer()
  
  // MARK: Knob API
  
  /** Knob control's start angle. Default: -11π/8 */
  public var startAngle: CGFloat {
    get { return knobRenderer.startAngle }
    set { knobRenderer.startAngle = newValue }
  }
  
  /** Knob control's end angle. Default: 3π/8 */
  public var endAngle: CGFloat {
    get { return knobRenderer.endAngle }
    set { knobRenderer.endAngle = newValue }
  }
  
  /** Knob control's width (in points). Default: 2.0 */
  public var lineWidth: CGFloat {
    get { return knobRenderer.lineWidth }
    set { knobRenderer.lineWidth = newValue }
  }
  
  /** Specifies the length in points of the pointer on the knob. Defaults to 6.0 */
  public var pointerLength: CGFloat {
    get { return knobRenderer.pointerLength }
    set { knobRenderer.pointerLength = newValue }
  }
  
  public var value: Float {
    get { return backingValue }
    set { setValue(newValue, animated: false) }
  }
  
  public func setValue(value: Float, animated: Bool) {
    if value != self.value {
      // Limit to requested bounds.
      self.backingValue = min(self.maximumValue, max(self.minimumValue, value))
      // Update Knob w/ correct angle
      let angleRange = endAngle - startAngle
      let valueRange = CGFloat(self.maximumValue - self.minimumValue)
      let angle = CGFloat(value - minimumValue) / valueRange * angleRange + startAngle
      knobRenderer.setPointerAngle(angle, animated: animated)
    }
  }
  
  /** The knob's minimum value. */
  public var minimumValue: Float = 0.0
  /** */
  public var maximumValue: Float = 1.0
  /** */
  public var continuous: Bool = true
  
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    createSublayers()
  }
  
  public required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented!")
  }
  
  func createSublayers() {
    knobRenderer.update(bounds)
    knobRenderer.strokeColor = tintColor
    knobRenderer.startAngle = -CGFloat(M_PI * 11.0 / 8.0)
    knobRenderer.endAngle = CGFloat(M_PI * 3.0 / 8.0)
    knobRenderer.pointerAngle = knobRenderer.startAngle
    knobRenderer.lineWidth = 2.0
    knobRenderer.pointerLength = 6.0
    
    layer.addSublayer(knobRenderer.trackLayer)
    layer.addSublayer(knobRenderer.pointerLayer)
    
  }
  
  public override func tintColorDidChange() {
    knobRenderer.strokeColor = tintColor
  }
  
  
}

private class KnobRenderer {
  
  
  var lineWidth: CGFloat = 1.0 {
    didSet { update() }
  }
  
  let trackLayer = CAShapeLayer()
  
  var startAngle: CGFloat = 0.0 {
    didSet { update() }
  }
  
  var endAngle: CGFloat = 0.0 {
    didSet { update() }
  }
  
  let pointerLayer = CAShapeLayer()
  
  var pointerLength: CGFloat = 0.0 {
    didSet { update() }
  }
  
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
  
  
  init() {
    trackLayer.fillColor = UIColor.clearColor().CGColor
    pointerLayer.fillColor = UIColor.clearColor().CGColor
  }
  
  
  func updateTrackLayerPath() {
    let arcCenter = CGPoint(x: trackLayer.bounds.width / 2.0, y: trackLayer.bounds.height / 2.0 )
    let offset = max(pointerLength, trackLayer.lineWidth / 2.0 )
    let radius = min(trackLayer.bounds.height, trackLayer.bounds.width) / 2.0 - offset
    trackLayer.path = UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true).CGPath
  }
  
  func updatePointerLayerPath() {
    let path = UIBezierPath()
    path.moveToPoint(CGPoint(x: pointerLayer.bounds.width - pointerLength - pointerLayer.lineWidth / 2.0, y: pointerLayer.bounds.height / 2.0))
    path.addLineToPoint(CGPoint(x: pointerLayer.bounds.width, y: pointerLayer.bounds.height / 2.0 ))
    pointerLayer.path = path.CGPath
  }
  
  func update() {
    trackLayer.lineWidth = lineWidth
    pointerLayer.lineWidth = lineWidth
    
    updateTrackLayerPath()
    updatePointerLayerPath()
  }
  
  func update(bounds: CGRect) {
    let position = CGPoint(x: bounds.width / 2.0, y: bounds.height / 2.0)
    
    trackLayer.bounds = bounds
    trackLayer.position = position
    
    pointerLayer.bounds = bounds
    pointerLayer.position = position
    
    update()
    
  }
  
}
