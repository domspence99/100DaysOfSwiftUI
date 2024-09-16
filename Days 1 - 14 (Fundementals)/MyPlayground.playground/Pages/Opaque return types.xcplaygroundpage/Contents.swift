import Foundation

//Random number function that returns an int
func getRandomNumber() -> Int {
    Int.random(in: 1...6)
}

//Random bool function that returns either true/false
func getRandomBool() -> Bool {
    Bool.random()
}

//Int and Bool both conform to a protocol called "Equatable"
//This protocol allows us to equate such as 6 == 6 or true == true

//We know you can return protocols from function but we can't for example return -> Equatable
//This is because we don't know if we are returning a Bool, Int, Double or String, therefore we could get into something like
//5 == true
//Yes Bool and Int are conform to equatable but they aren't interchangable

//Returning a protocol is useful because instead of specifically returning a Car struct / Train struct for example, we can hide information and tell swift, we dont care what type of struct you return, just that is some type of Vehicle

//Opaque functions can help us here as we can tell swift that we don't know exactly which type of the protocol we want to return just yet. Only that it will be some type.
//E.g we can return -> some Equatable. This means we dont know which type but it will be an equatable.
//Swift effectively skips over this & understands by the consequent code which type is being used.
//This allows us to be flexible with our code by returning some type that we haven't specified yet.

//Random number function that returns some equatable
func getRandomNumber2() -> some Equatable {
    Int.random(in: 1...6) //SWIFT can tell by the code that an Int will be returned - which is an equatable - so this is allowed
}

//Random bool function that returns some equatable
func getRandomBool2() -> some Equatable {
    Bool.random() //SWIFT can tell by the code that a Bool will be returned - which is an equatable - so this is allowed
}

print(getRandomBool2() == getRandomBool2())

//By returning some Equatable, it means in the future if we wanted, we could change the function to return a double as it is still some equatable and swift will see what is returned and allow that


//**This is used a lot in SWIFT where functions return -> some View
//This just means that some View - comprised of nav bars, divs, etc will be returned but we don't specifically say what they are yet. It allows us a lot of flexibility


//When you see some View in your SwiftUI code, it’s effectively us telling Swift “this is going to send back some kind of view to lay out, but I don’t want to write out the exact thing – you figure it out for yourself.”
