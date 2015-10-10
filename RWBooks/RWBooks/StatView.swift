//
//  StatView.swift
//  MyStats3
//
//  Created by Main Account on 5/11/15.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//

import UIKit

@IBDesignable
class StatView: UIView {

  let circleBackgroundLayer = CAShapeLayer()
  let circleForegroundLayer = CAShapeLayer()
  
  let percentLabel = UILabel()
  let captionLabel = UILabel()
  
  
  @IBInspectable var circleBackgroundColor: UIColor = UIColor.grayColor() {
    didSet {
      configure()
    }
  }

  @IBInspectable var circleForegroundColor: UIColor = UIColor.whiteColor() {
    didSet {
      configure()
    }
  }
  
  var range = CGFloat(10)
  var curValue = CGFloat(0) {
    didSet {
      // configure()
      animateCircle()
    }
  }
  let margin = CGFloat(10)
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setup()
    configure()
  }
  
  override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    setup()
    configure()
  }
  
  func setup() {
    
    // Setup circle background layer
    circleBackgroundLayer.lineWidth = CGFloat(20.0)
    circleBackgroundLayer.fillColor = UIColor.clearColor().CGColor
    circleBackgroundLayer.strokeEnd = 1
    layer.addSublayer(circleBackgroundLayer)

    // Setup circle foreground layer
    circleForegroundLayer.lineWidth = CGFloat(20.0)
    circleForegroundLayer.fillColor = UIColor.clearColor().CGColor
    circleForegroundLayer.strokeEnd = 0
    layer.addSublayer(circleForegroundLayer)
    
    
    // Setup percent label
    percentLabel.font = UIFont(name: "Avenir Next", size: 26)
    percentLabel.textColor = UIColor.whiteColor()
    percentLabel.translatesAutoresizingMaskIntoConstraints = false
    addSubview(percentLabel)
    
    // Setup caption label
    captionLabel.font = UIFont(name: "Avenir Next", size: 26)
    captionLabel.text = "Chapters Read"
    captionLabel.textColor = UIColor.whiteColor()
    captionLabel.translatesAutoresizingMaskIntoConstraints = false
    addSubview(captionLabel)
    
    // Setup constraints
    let percentLabelCenterX = NSLayoutConstraint(item: percentLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1.0, constant: 0)
    let percentLabelCenterY = NSLayoutConstraint(item: percentLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1.0, constant: -margin)
    NSLayoutConstraint.activateConstraints([percentLabelCenterX, percentLabelCenterY])
    
    let captionLabelCenterX = NSLayoutConstraint(item: captionLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1.0, constant: -margin)
    let captionLabelBottomY = NSLayoutConstraint(item: captionLabel, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1.0, constant: -margin)
    NSLayoutConstraint.activateConstraints([captionLabelCenterX, captionLabelBottomY])

  }
  
  func configure() {
    percentLabel.text = String(format: "%.0f/%.0f", curValue, range)
    circleBackgroundLayer.strokeColor = circleBackgroundColor.CGColor
    circleForegroundLayer.strokeColor = circleForegroundColor.CGColor
    
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    setupShapeLayer(circleBackgroundLayer)
    setupShapeLayer(circleForegroundLayer)
  }
  
  
  func setupShapeLayer(shapeLayer: CAShapeLayer) {
    shapeLayer.frame = self.bounds
    
    let center = percentLabel.center
    let radius = CGFloat(CGRectGetWidth(self.bounds) * 0.35)
    let startAngle = DegreesToRadians(135.0)
    let endAngle = DegreesToRadians(45.0)
    let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)

    shapeLayer.path = path.CGPath
  }
  
  func animateCircle() {
    percentLabel.text = String(format: "%.0f/%.0f",curValue, range)
    // setup values
    var fromValue = circleForegroundLayer.strokeEnd
    let toValue = curValue / range
    if let _ = circleForegroundLayer.presentationLayer() as? CAShapeLayer {
      fromValue = (circleForegroundLayer.presentationLayer()?.strokeEnd)!
    }
    let percentageChange = abs(fromValue - toValue)
    // setup animation
    let animation = CABasicAnimation(keyPath: "strokeEnd")
    animation.fromValue = fromValue
    animation.toValue = toValue
    animation.duration = CFTimeInterval(percentageChange * 4)
    circleForegroundLayer.removeAnimationForKey("stroke")
    circleForegroundLayer.addAnimation(animation, forKey: "stroke")
    CATransaction.begin()
    CATransaction.setDisableActions(true)
    circleForegroundLayer.strokeEnd = toValue
    CATransaction.commit()
    
  }
  
  
}