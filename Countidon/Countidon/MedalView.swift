//
//  MedalView.swift
//  Countidon
//
//  Created by Karsten Gresch on 01.10.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit



class MedalView: UIImageView {

  lazy var medalImage: UIImage = self.createMedalImage()
  
  func showMedal(show: Bool) {
    if show {
      image = medalImage
    } else {
      image = nil
    }
    
  }
  
  func createMedalImage() -> UIImage {
    print("Creating medal image.")
    
    let size = CGSize(width: 120, height: 200)
    
    UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
    let context = UIGraphicsGetCurrentContext()
    
    
    
    // gold colors
    let darkGoldColor = UIColor(red: 0.6, green: 0.5, blue: 0.15, alpha: 1.0)
    let midGoldColor = UIColor(red: 0.86, green: 0.73, blue: 0.3, alpha: 1.0)
    let lightColdColor = UIColor(red: 1.0, green: 0.98, blue: 0.9, alpha: 1.0)
    
    // Add shadow
    let shadow: UIColor = UIColor.blackColor().colorWithAlphaComponent(0.3)
    let shadowOffset = CGSizeMake(2.0, 2.0)
    let shadowBlurRadius: CGFloat = 4
    
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor)
    
    CGContextBeginTransparencyLayer(context, nil)
    
    // lower ribbon
    let lowerRibbonPath = UIBezierPath()
    lowerRibbonPath.moveToPoint(CGPointMake(0, 0))
    lowerRibbonPath.addLineToPoint(CGPointMake(40, 0))
    lowerRibbonPath.addLineToPoint(CGPointMake(78, 70))
    lowerRibbonPath.addLineToPoint(CGPointMake(38, 70))
    lowerRibbonPath.closePath()
    UIColor(red: 0.99, green: 0.4, blue: 0.4, alpha: 0.8).setFill()
    lowerRibbonPath.fill()
    
    // clasp
    // o what punny this is!
    let claspPath = UIBezierPath(roundedRect: CGRectMake(36, 62, 43, 20), cornerRadius: 5)
    claspPath.lineWidth = 5
    darkGoldColor.setStroke()
    claspPath.stroke()
    
    // medallion
    let medallionPath = UIBezierPath(ovalInRect: CGRect(origin: CGPointMake(8, 72), size: CGSizeMake(100, 100)))
    CGContextSaveGState(context)
    medallionPath.addClip()
    let gradient = CGGradientCreateWithColors(CGColorSpaceCreateDeviceRGB(), [darkGoldColor.CGColor, midGoldColor.CGColor, lightColdColor.CGColor], [0, 0.51, 1])
    CGContextDrawLinearGradient(context, gradient, CGPointMake(40, 40), CGPointMake(100, 160),  CGGradientDrawingOptions())
    CGContextRestoreGState(context)
    
    // medallion's inner edge
    var transform = CGAffineTransformMakeScale(0.8, 0.8)
    transform = CGAffineTransformTranslate(transform, 15, 30)
    medallionPath.lineWidth = 2.0
    medallionPath.applyTransform(transform)
    medallionPath.stroke()
    
    // upper ribbon
    let upperRibbonPath = UIBezierPath()
    upperRibbonPath.moveToPoint(CGPointMake(68, 0))
    upperRibbonPath.addLineToPoint(CGPointMake(108, 0))
    upperRibbonPath.addLineToPoint(CGPointMake(78, 70))
    upperRibbonPath.addLineToPoint(CGPointMake(38, 70))
    upperRibbonPath.closePath()
    
    UIColor(red: 0.5, green: 0.7, blue: 0.88, alpha: 0.8).setFill()
    // UIColor.blueColor().setFill()
    upperRibbonPath.fill()
    
    // number 1a´
    let number = "1"
    let numberOneRect = CGRectMake(47, 100, 50, 50)
    let font = UIFont(name: "Academy Engraved LET", size: 60)
    // let textStyle = NSMutableParagraphStyle.defaultParagraphStyle()
    if let numberOneFont = font {
      let numberOneAttributes = [NSFontAttributeName: numberOneFont, NSForegroundColorAttributeName: darkGoldColor]
      number.drawInRect(numberOneRect, withAttributes: numberOneAttributes)
    }
    
    CGContextEndTransparencyLayer(context)
    
    // keep @ end!
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return image
    
  }

}
