//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var view = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
view.backgroundColor = UIColor.greenColor()

var label = UILabel(frame: CGRect(x: view.frame.width/2, y: 0, width: 150, height: 150))
label.text = "Hi, folks!"
view.addSubview(label)


var preTaxBill = 19.99
let tipPercentage = 20
let taxPercentage = 6

var tipAmount = round(preTaxBill * Double(tipPercentage) / 100)
var taxAmount = preTaxBill * Double(taxPercentage) / 100

let numberOfPlaces = 2.0
let multiplier = pow(10.0, numberOfPlaces)

var finalAmount = round((preTaxBill + tipAmount + taxAmount) * multiplier) / multiplier



