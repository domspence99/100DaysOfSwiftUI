import Foundation

//CLOSURES
//Closures are blocks of code that operate as functions (taking in parameters and returning values) without the need to create stand alone functions
// They can be executed in-line and are can be useful when used within other functions without the need to create another function

//CREATING COPIES OF FUNCTIONS
func greeting() {
    print("Greeting message")
}

greeting() //original function
let greetingCopy = greeting //creates a copy of function (without parenthases)
greetingCopy() //copy function


//If you want the functionality of the function without having to create a standalone function you can create a closure expression that CREATES A CHUNK OF CODE AND ASSIGNS TO A VARIABLE TO BE PASSED AROUND AND USED

//CLOSURE EXPRESSION
let greetingExpression = {
    print("greeting expression")
}

greetingExpression()

//This greeting expression is a variable that can be executed - basically acting as a function without defining a funciton


//CLOSURE EXPRESSION WITH PARAMETERS & RETURN
//We can also create these closures with parameters and return types

let greetingExpressionWithParams = { (name: String) -> String in
    //in tells compiler that you have finished with the parameters and return types within your closure expression and to execute the code below
    "Hello \(name) todo bien amiga"
}

print(greetingExpressionWithParams("Aldi"))


//Closures let us wrap up some functionality in a single variable, then store that somewhere. We can also return it from a function, and store the closure somewhere else.

//* To return a value in a closure without a parameter you can write as follows
//let closureVariable = { () -> Bool ...

//* closures DO NOT CARE ABOUT PARAMETER LABELS i.e when you call them you dont need the labels ^ greetingExpressionWithParams("Aldi) not (name: "Aldi)


//HOW TO USE CLOSURES TO AFFECT THE FUNCTIONALITY OF EXISTING FUNCTIONS
//If we use the sort function as an example, we can use a closure inside the sort function to dictate how the sort works & what tests it runs

//The sort function accepts 2 string parameters and returns true/false if the string should be before or after the other string
//i.e return true if it should be before other string, return false if it should be after the current string

let team = ["Aldi", "Thomas", "Tommy", "Aratz", "Dom", "Mili"]

//Sort by closure / take 2 strings and put dom to front
let teamSortedFromDom = team.sorted(by: {(name1: String, name2: String) -> Bool in
    if name1 == "Dom"{
        return true
    }
    else if name2 == "Dom"{
        return false
    }
    
    return name1 < name2 //if neither name is dom, just sort the other names
})
                             
print(teamSortedFromDom)


//REDUCING CODE WITH SYNTAX
//As the function "sorted" can only take 2 string parameters and return a bool and will not work without those conditions met, we don't have to repeat ourselves and specify that again within the cloure
// We could just say team.sorted(by: {name1, name2 in ...

//We can also reduce the code more by using 'trailing closing syntax' which allows us to just pass the closure instead of adding it to the closure parameter so the code can be reduced to
                             
let teamSortedFromDomSyntaxed = team.sorted{ name1, name2 in
    if name1 == "Dom"{
        return true
    }
    else if name2 == "Dom"{
        return false
    }
    
    return name1 < name2 //if neither name is dom, just sort the other names
}
                             
print(teamSortedFromDomSyntaxed)


//SHORTHAND SYNTAX
//Swift provides further syntax for the parameters so that we don't need to specify variable names ourselves (name1, name2) and we can instead just use $0, $1 as the variables created by swift automatically

// We can do this because as we said, we know the sorted function can only take 2 strings and return a bool

//This reduces the code further to

let teamSortedFromDomShorthand = team.sorted{
    if $0 == "Dom"{
        return true
    }
    else if $1 == "Dom"{
        return false
    }
    
    return $0 < $1 //if neither name is dom, just sort the other names
}
                             
print(teamSortedFromDomShorthand)


//USING SHORTHAND ON OTHER EXAMPLES
//1. Reverse sort

let reverseSort = team.sorted {
    $0 > $1 //string reversed
}

print(reverseSort)

//2. Filter using custom filter
//The filter function filters an array using whatever code you decide, i.e
let filterT = team.filter {
    $0.hasPrefix("T") //if element has prefix T, return true and add to new array
}

print(filterT)

//3. Transforming arrays

let capitalTeam = team.map {
    $0.uppercased() //take element & make uppercase
}

print(capitalTeam)

//Theres no right or wrong place to use variable names/shorthand syntax in code but its recomended to be used only when you don't repeat the sh syntax more than ones or if you have more than 3 parameters


//ACCEPTING FUNCTIONS AS PARAMETERS
//We are going to be creating a function that adds numbers to an array based upon other function - in this case a random number generator

//1. R number generator function
func randNum() -> Int {
    Int.random(in: 0...100)
}
//2. Creating second function that makes arrays depending on a function
//2.1 Function takes in size of array as int
//2.2 Uses random function accepting no parameters and returning an int
//2.3 randNumArray returns an int array
func makeArray(size: Int, using randNum: () -> Int) -> [Int] {
    var numArray = [Int]() //defining empty int array
    
    for _ in 0..<size {
        var randomNumber = randNum() //gets random number from rand func
        numArray.append(randomNumber) //appends to array
    }
    return numArray //returns random numbered array
}

print(makeArray(size: 20, using: randNum)) //makes array using ranNum function

//Now we have our makeArray function, we can use a closure to alter the functionaility of make array to create a custom array

//here we are using our previus makearray function but now we are changing the passed in function that was previously randNum
// now the randNum function has been changed to a closure that returns a random number between 1 and 6
//imagine in the function above we swap wherever it says randNum() to this custom closure below
// we can do this as the passed in function needs to take no parameters and return an int which this custom closure below does
let diceRolls = makeArray(size: 20) {
    Int.random(in: 1...6) //takes in no paramters and returns an int
}

print(diceRolls)


//FUNCTIONS ALLOWING MULTIPLE FUNCTION PARAMETERS
//This function will allow 3 closures to be added and ran inside this function

//f,s,t are functions that accepts no parameters and returns nothing
func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("Do first work")
    first()
    print("Do second work")
    second()
    print("Do third work")
    third()
    print("Done")
}

//To call this using 3 trailing closures, we do the first one as normal, then use the parameter name followed by a : then the second closure etc..

doImportantWork { //imagine first:
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}



//CHECKPOINT 5
//FILTER, MAP AND SORT AN ARRAY USING CUSTOM CLOSURES

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
print(luckyNumbers)
//1. Filter out even numbers
// Filter takes 1 parameter and returns a bool
var oddNumbers = luckyNumbers.filter {
    $0 % 2 == 1 //if element /2 has a remainder, return true and add to array
}
print(oddNumbers)

//2.Sort out array in ascending order
// Sorted takes 2 parameters and returns a bool where to add back to array
//if condition is true, put the first element before second...
var sortedOddNumbers = oddNumbers.sorted {
    $0 > $1 //if the first element is greater than second then put first
}
print(sortedOddNumbers)

//3. Map strings to format, e.g "7 is a lucky number"
//Map takes in 1 parameter, changes the format & returns it to array
var mappedOddNumbers = sortedOddNumbers.map {
    "\($0) is a lucky number" //return element + is a lucky number
}
print(mappedOddNumbers)


//4. Print the results from the array, 1 line at a time
for i in 0...mappedOddNumbers.count - 1 {
    print(mappedOddNumbers[i])
}

//AFTER SOLUTION
//To make this code cleaner you can use

let solve = luckyNumbers.filter {!$0.isMultiple(of: 2)}
    .sorted()
    .map {print("\($0) is a lucky number")}

