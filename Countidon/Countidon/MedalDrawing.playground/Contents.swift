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
UIColor.redColor().setFill()
lowerRibbonPath.fill()

// keep @ end!
let image = UIGraphicsGetImageFromCurrentImageContext()
UIGraphicsEndImageContext()