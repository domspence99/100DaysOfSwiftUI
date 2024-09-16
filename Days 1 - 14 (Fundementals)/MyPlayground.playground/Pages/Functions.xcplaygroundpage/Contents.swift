import Foundation //imports sqrt
//FUNCTIONS

func displayTimesTable(number: Int, multiplication: Int) { //PARAMETERS (Placeholder for function)
    for i in 1...multiplication {
        print(number * i)
    }
}

displayTimesTable(number: 5, multiplication: 4) //ARGUMENTS
//*Remember to state the arguments & tyoes


let root = sqrt(144)
print(root)

//RETURN FROM FUNCTION
//To return from function you must use -> and state return type

//lets you pick dice size of Int and returns an int between
func rollDice(diceNumber: Int) -> Int {
    return Int.random(in: 1...diceNumber)
}

var diceOutput = rollDice(diceNumber: 12)
print(diceOutput)

//EXAMPLE TEST

func compareStringLetters(string1: String, string2: String) -> Bool {
    if string1.sorted() == string2.sorted(){
        return true
    }
    else {
        return false
    }
}
//*** dont need the if else return true/false as it is already returning a bool
//could do return string1.sorted()==string2...
//as there is only 1 line of code you don't even need to use the return keyword (only works with 1 line of code & must return correct type)

print(compareStringLetters(string1: "Hello", string2: "olleH"))

//EXAMPLE TEST2
//MAKE A PYTHAG FUNC

func pythag(a: Double, b: Double) -> Double {
    sqrt((a*a) + (b*b))
}

print(pythag(a: 3.4,b: 7.4))



//RETURNING MULTIPLE VALUES FROM FUNCTION
//We can return multiple values from a function using tuples

//returns a tuple with 2 strings named first & last
func returnUser() -> (firstName: String, lastName: String) {
    return (firstName: "Dom", lastName: "Spence")
    //Could also just do
    //("Dom","Spence")
    //as we dont need return statement * dont need to restate the tuple names
    
    //could also not specify tuple names * just put (String:String) & access using user3.0, user3.1
}

var user3 = returnUser()
print(user3.firstName + " " + user3.lastName)
//could also do user3.0, user3.1
//or
//var (firstName, lastName) = returnUser()


//LABEL CONVENTIONS
//Sometimes its not always good to contain the variable names within the function parameters and arguments i.e hasPrefix("Some string") instead of hasPreifix(prefix: "Some string)

//We can eliminate this need by using _ within the function parameter names

//For example the _ number means you dont have to say number: 5 in the printTT function
func printTimesTable(_ number: Int){
    for i in 1...12{
        print("\(i) * \(number) is \(i*number)")
    } //returns the bool of this case
}
printTimesTable(5)

//_ REMOVES PARAMETER NAME!!!!!!


