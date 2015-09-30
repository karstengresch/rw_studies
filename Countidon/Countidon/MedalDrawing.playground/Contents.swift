//: Playground - noun: a place where people can play

import UIKit

let size = CGSize(width: 120, height: 200)

UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
let context = UIGraphicsGetCurrentContext()



// gold colors
let darkGoldColor = UIColor(red: 0.6, green: 0.5, blue: 0.15, alpha: 1.0)
let midGoldColor = UIColor(red: 0.86, green: 0.73, blue: 0.3, alpha: 1.0)
let lightColdColor = UIColor(red: 1.0, green: 0.98, blue: 0.9, alpha: 1.0)

// lower ribbon
var lowerRibbonPath = UIBezierPath()
lowerRibbonPath.moveToPoint(CGPointMake(0, 0))
lowerRibbonPath.addLineToPoint(CGPointMake(40, 0))
lowerRibbonPath.addLineToPoint(CGPointMake(78, 70))
lowerRibbonPath.addLineToPoint(CGPointMake(38, 70))
lowerRibbonPath.closePath()
UIColor(red: 0.99, green: 0.4, blue: 0.4, alpha: 0.8).setFill()
lowerRibbonPath.fill()

// clasp
// o what punny this is!
var claspPath = UIBezierPath(roundedRect: CGRectMake(36, 62, 43, 20), cornerRadius: 5)
claspPath.lineWidth = 5
darkGoldColor.setStroke()
claspPath.stroke()

// medallion
var medallionPath = UIBezierPath(ovalInRect: CGRect(origin: CGPointMake(8, 72), size: CGSizeMake(100, 100)))
CGContextSaveGState(context)
medallionPath.addClip()
let gradient = CGGradientCreateWithColors(CGColorSpaceCreateDeviceRGB(), [darkGoldColor.CGColor, midGoldColor.CGColor, lightColdColor.CGColor], [0, 0.51, 1])
CGContextDrawLinearGradient(context, gradient, CGPointMake(40, 40), CGPointMake(100, 160),  CGGradientDrawingOptions())
CGContextSaveGState(context)

// medallion's inner edge
var transform = CGAffineTransformMakeScale(0.80, 0.80)
transform = CGAffineTransformTranslate(transform, 15, 30)
medallionPath.lineWidth = 1.85
medallionPath.applyTransform(transform)
medallionPath.stroke()

// keep @ end!
let image = UIGraphicsGetImageFromCurrentImageContext()
UIGraphicsEndImageContext()