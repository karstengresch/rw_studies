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
  
  func showMedal(_ show: Bool) {
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
    let shadow: UIColor = UIColor.black.withAlphaComponent(0.3)
    let shadowOffset = CGSize(width: 2.0, height: 2.0)
    let shadowBlurRadius: CGFloat = 4
    
    context?.setShadow(offset: shadowOffset, blur: shadowBlurRadius, color: shadow.cgColor)
    
    context?.beginTransparencyLayer(auxiliaryInfo: nil)
    
    // lower ribbon
    let lowerRibbonPath = UIBezierPath()
    lowerRibbonPath.move(to: CGPoint(x: 0, y: 0))
    lowerRibbonPath.addLine(to: CGPoint(x: 40, y: 0))
    lowerRibbonPath.addLine(to: CGPoint(x: 78, y: 70))
    lowerRibbonPath.addLine(to: CGPoint(x: 38, y: 70))
    lowerRibbonPath.close()
    UIColor(red: 0.99, green: 0.4, blue: 0.4, alpha: 0.8).setFill()
    lowerRibbonPath.fill()
    
    // clasp
    // o what punny this is!
    let claspPath = UIBezierPath(roundedRect: CGRect(x: 36, y: 62, width: 43, height: 20), cornerRadius: 5)
    claspPath.lineWidth = 5
    darkGoldColor.setStroke()
    claspPath.stroke()
    
    // medallion
    let medallionPath = UIBezierPath(ovalIn: CGRect(origin: CGPoint(x: 8, y: 72), size: CGSize(width: 100, height: 100)))
    context?.saveGState()
    medallionPath.addClip()
    let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: [darkGoldColor.cgColor, midGoldColor.cgColor, lightColdColor.cgColor], locations: [0, 0.51, 1])
    context.drawLinearGradient(gradient, start: CGPoint(x: 40, y: 40), end: CGPoint(x: 100, y: 160),  options: CGGradientDrawingOptions())
    context?.restoreGState()
    
    // medallion's inner edge
    var transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
    transform = transform.translatedBy(x: 15, y: 30)
    medallionPath.lineWidth = 2.0
    medallionPath.apply(transform)
    medallionPath.stroke()
    
    // upper ribbon
    let upperRibbonPath = UIBezierPath()
    upperRibbonPath.move(to: CGPoint(x: 68, y: 0))
    upperRibbonPath.addLine(to: CGPoint(x: 108, y: 0))
    upperRibbonPath.addLine(to: CGPoint(x: 78, y: 70))
    upperRibbonPath.addLine(to: CGPoint(x: 38, y: 70))
    upperRibbonPath.close()
    
    UIColor(red: 0.5, green: 0.7, blue: 0.88, alpha: 0.8).setFill()
    // UIColor.blueColor().setFill()
    upperRibbonPath.fill()
    
    // number 1a´
    let number = "1"
    let numberOneRect = CGRect(x: 47, y: 100, width: 50, height: 50)
    let font = UIFont(name: "Academy Engraved LET", size: 60)
    // let textStyle = NSMutableParagraphStyle.defaultParagraphStyle()
    if let numberOneFont = font {
      let numberOneAttributes = [NSFontAttributeName: numberOneFont, NSForegroundColorAttributeName: darkGoldColor]
      number.draw(in: numberOneRect, withAttributes: numberOneAttributes)
    }
    
    context?.endTransparencyLayer()
    
    // keep @ end!
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return image!
    
  }

}
