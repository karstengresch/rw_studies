//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

for var i = 0; i < 10; i++ {
  println(i)
  
}

var dictTest = ["key01": "value1", "key02": "value2"]
println(dictTest)

let movieTypes = ["Immoral Tales" : "Erotic", "Brinkmanns Zorn" : "Drama", "Strata" : "Sci Fi"]
println(movieTypes)


for i in 1 ... 100
{
  let fizzNumber = i % 3 == 0
  let buzzNumber = i % 5 == 0
  let fizzBuzzNumber = fizzNumber && buzzNumber
  
  if (fizzBuzzNumber == false)
  {
    
    if fizzNumber
    {
      println("\(i) Fizz")
    }
    else if buzzNumber
    {
      println("\(i) Buzz")
    }
    else
    {
      println(i)
    }
    
  }
  else if fizzBuzzNumber
  {
    println("\(i) Fizz Buzz")
  }
  
  
}

println("-------------")

for i in 1 ... 100
{
  switch (i)
  {
  case _ where i % 3 == 0 && i % 5 == 0:
    println("\(i) Fizz Buzz")
    
  case _ where i % 3 == 0:
    
    println("\(i) Fizz")
  case _ where i % 5 == 0:
    
    println("\(i) Buzz")
  default:
    println(i)
    
  }
}