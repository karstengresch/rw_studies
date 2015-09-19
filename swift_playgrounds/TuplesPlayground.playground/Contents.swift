//: Playground - noun: a place where people can play

import UIKit

import Foundation

func randomIndex(count: Int) -> Int {
  return Int(arc4random_uniform(UInt32(count)))
}

// Your code here! Write knockKnockJoke() function
// Make an array of 3 knock knock jokes
// Return a random joke!

func knockKnockJoke() -> (who:String, punchline:String) {
  
  let jokes = [("Canoe", "Canoe help me with my homework?"), ("Merry", "Merry Christmas!"), ("Orange", "Orange you going to let me in?"), ("Anee", "Anee one you like!"), ("Iva", "I’ve a sore hand from knocking!"), ("Dozen", "Dozen anybody want to let me in?"), ("Henrietta.", "Henrietta worm that was in his apple."), ("Avenue", "Avenue knocked on this door before?")]
  
  return jokes[randomIndex(jokes.count)]
  
}


let joke = knockKnockJoke()
println("Knock, knock.")
println("Who's there?")
println("\(joke.who)")
println("\(joke.who) who?")
println("\(joke.punchline)")
