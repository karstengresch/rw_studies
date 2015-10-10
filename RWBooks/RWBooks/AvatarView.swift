//
//  AvatarView.swift
//  MyStats3
//
//  Created by Main Account on 5/11/15.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//

import UIKit

@IBDesignable
class AvatarView: UIView {
  
  let margin = CGFloat(10.0)
  let labelName = UILabel()
  let imageView = UIImageView()
  let layerGradient = CAGradientLayer()
  
  let strokeColor = UIColor(red:1,  green:1,  blue:1, alpha:1)
  
  @IBInspectable var startColor: UIColor = UIColor.whiteColor()
  @IBInspectable var endColor: UIColor = UIColor.blackColor()
  
  
  @IBInspectable var imageAvatar: UIImage? {
    didSet {
      configure()
    }
  }
  
  func setup() {
    
    layer.addSublayer(layerGradient)

    // Setup image view
    imageView.layer.borderColor = strokeColor.CGColor
    imageView.layer.borderWidth = 2.75
    imageView.layer.masksToBounds = true
    
    imageView.contentMode = .ScaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(imageView)
    
    // Setup label
    labelName.font = UIFont(name: "AvenirNext-Bold", size: 26.0)
    labelName.textColor = UIColor.blackColor()
    labelName.text = "Ray Wenderlich"
    labelName.translatesAutoresizingMaskIntoConstraints = false
    addSubview(labelName)
    
    labelName.setContentHuggingPriority(1000, forAxis: .Vertical)
    
    // Setup constraints
    let labelNameCenterX = NSLayoutConstraint(item: labelName, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0)
    let labelNameBottomY = NSLayoutConstraint(item: labelName, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1, constant: 0)
    NSLayoutConstraint.activateConstraints([labelNameCenterX, labelNameBottomY])

    let imageViewCenterX = NSLayoutConstraint(item: imageView, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0)
    let imageViewTopY = NSLayoutConstraint(item: imageView, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1, constant: margin)
    let imageViewBottomY = NSLayoutConstraint(item: imageView, attribute: .Bottom, relatedBy: .Equal, toItem: labelName, attribute: .Top, multiplier: 1, constant: -margin)
    let imageViewWidth = NSLayoutConstraint(item: imageView, attribute: .Width, relatedBy: .Equal, toItem: imageView, attribute: .Height, multiplier: 1, constant: 0)
    NSLayoutConstraint.activateConstraints([imageViewCenterX, imageViewTopY, imageViewBottomY, imageViewWidth])

  }
  
  func configure() {
    
    // Configure image view
    imageView.image = imageAvatar
    layerGradient.colors = [startColor.CGColor, endColor.CGColor]
    layerGradient.startPoint = CGPoint(x: 0.5, y: 0)
    layerGradient.endPoint = CGPoint(x: 0.5, y: 1)
    
    
  }
  
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
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    layerGradient.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetMidY(self.bounds))
    
    
    imageView.layer.cornerRadius = CGRectGetHeight(imageView.bounds) / 2
  }
  
}
