//: Playground - noun: a place where people can play

import UIKit


/*
Your challenge is to make a “Game of Thrones” dictionary with three key/value pairs:
key: “Oberyn”, value: “Spear”
key: “Arya”, value: “Sword”
key: “Ygritte”, value: “Bow”
Then:
Add a new key/value pair to the dictionary: key: “Tyrion”, value: “Crossbow”
Append to the value for key “Arya” the string ” (Needle)” (use the + operator to do this)
Remove entries for any/all dead characters!
*/

var gameOfThronesCharacters = ["Oberyn" : "Spear", "Arya" : "Sword", "Ygritte" : "Bow"]

println(gameOfThronesCharacters)
gameOfThronesCharacters["Tyrion"] = "Crossbow"
// Dunno who's dead
gameOfThronesCharacters.removeValueForKey("Arya")
println(gameOfThronesCharacters)
gameOfThronesCharacters