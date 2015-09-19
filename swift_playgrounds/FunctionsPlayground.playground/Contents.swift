//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func count(#targetNumber:Int) -> () {
  for n in 0 ... targetNumber {
    println(n)
  }
}

count(targetNumber:19)

// challenge
func sumOfMultiples(#multiple1: Int, #multiple2: Int, belowValue:Int=1000) -> Int {
  
  var sum : Int = 0
  
  for counter in 0..<belowValue
  {
    if(counter % multiple1 == 0 || counter % multiple2 == 0)
    {
      sum += counter
    }
  }
  return sum
}

var challengeValue = sumOfMultiples(multiple1: 3, multiple2: 5)
println(challengeValue)