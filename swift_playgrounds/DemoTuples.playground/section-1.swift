// Playground - noun: a place where people can play

import UIKit

let page = (40, "It was the best of times, it was the worst of times")
page.0
page.1

let (pageNumber, pageText) = page
pageNumber
pageText

//let anotherPage = (pageNumber:10, pageText:"Call me, Ishmael.")
let anotherPage:(pageNumber:Int, pageText:String) = (10, "Call me, Ishmael")
anotherPage.pageNumber
anotherPage.pageText

func currentPage() -> (pageNumber:Int, pageText:String) {
  return (1, "It was a bright cold day in April, and the clocks were striking thirteen.")
}

currentPage().pageText
currentPage().pageNumber

let books = [("A Wrinkle in Time", 10, 199, "Young Adult"), ("On the Road", 18, 250, "Literature"), ("Hop on Pop", 3, 30, "Childrens")]

for book in books {
  print("\(book.0) - ")
  switch book {
  case (_,18,let pageCount,let genre):
    print("This book is for older readers - \(pageCount) pages - \(genre)")
  case (_,1...4,_,_):
    print("Kid friendly")
  default:
    print("An uncataloged book")
    
  }
  println()
}

var name1 = "Ray"
var name2 = "Wenderlich"
//var temp = "Ray"
//name1 = name2
//name2 = temp
//
//name1
//name2

(name1, name2) = (name2, name1)
name1
name2









