//: Playground - noun: a place where people can play

import UIKit

var doubleStringTest:Double = 3.14
var stringDoubleTest:String = String(format: "%.2f", doubleStringTest)

let emoji = "🍰"
let name = "Nai"
let noun = "gorgeous beautiful programming language"
var story = "When \(name) saw \(noun), he was like \(emoji)!"

/* 
Your challenge is to make an array with 3 strings: “C”, “C++”, and “Objective-C”. Then:
Append “Swift” to the array
Insert “Javascript” at index 2
Remove “Objective-C” (without hardcoding its index)
*/

var languages = ["C", "C++", "Objective-C"]
languages.append("Swift")
languages.insert("Javascript", atIndex: 2)
languages.removeAtIndex(3)
languages

