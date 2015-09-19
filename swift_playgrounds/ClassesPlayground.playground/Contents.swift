//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Animal {
  
  let name: String
  
  func speak() {}
  
  init (xName: String)
  {
    name = xName
    
  }
  
}

class Dog : Animal {

  override func speak() {
    println("Woof!")
  }
  init ()
  {
    super.init(xName: "Dog")
  }
}

class Cat : Animal {
  
  override func speak() {
    println("Meeou!")
  }
  init ()
  {
    super.init(xName: "Cat")
  }
}

class Fox : Animal {
  
  override func speak() {
    println("Ring-ding-ding-ding-dingeringeding")
  }
  init ()
  {
    super.init(xName: "Fox")
  }
}

let animals = [Dog(), Cat(), Fox()]
for animal in animals {
  animal.speak()
}