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

  let percentLabel = UILabel()
  let captionLabel = UILabel()
  
  var range = CGFloat(10)
  var curValue = CGFloat(0) {
    didSet {
      configure()
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
    
    // Setup percent label
    percentLabel.font = UIFont(name: "Avenir Next", size: 26)
    percentLabel.textColor = UIColor.whiteColor()
    percentLabel.text = "0/0"
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
  }
  
  override func layoutSubviews() {
    
  }
  
}