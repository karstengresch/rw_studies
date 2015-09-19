//: Playground - noun: a place where people can play

import UIKit

var optionalString:String? = "Here I am"

// optionalString = nil

if let optionalString = optionalString {
  println("The message is: " + optionalString)
}
else
{
  println("No message for you!")
}

var temp:String!
var number = 10

if number % 2 == 0
{
  temp = "Even"
} else
{
  temp = "Odd"
}

println(temp)

class Game {
  var player:Player?
}

class Player  {
  var name:String
  init (name:String) {
    self.name = name
  }
}

var game = Game()
var player = Player(name: "Karsten")
game.player = player
if let playerName = game.player?.name {
  println(playerName)
}

var name = game.player?.name ?? "Unkown name"

// challenge

var thename:String? = "Brian"
var greeting = "Hello,"

if let thename = thename {
  println(greeting + " " + thename)
}

// unwrapping dangerous!
println(greeting + " " + thename!)


