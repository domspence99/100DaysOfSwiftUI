import Foundation

//Optionals are variables that might have a value (not nil) or might not (nil)

//For example

let opposites = ["Mario":"Wario", "Luigi":"Waluigi"] //creating a [String:String] dictionary of opoosite characters [key, value]

//If we wanted to create a variable for oppositePeach, it wouldn't make any sense because peach doesn't exist & there is no default value for it

let oppositePeach = opposites["Peach"] //oppisitePeach will be set to an optiona string String? wtih a value of nil

//In this case we could use an optional to check if the string "Peach" is there.
//If we set the data type to a string optional (String?) swift can check if the data is there or not

//In order to use optionals we must first unwrap the optional before we can use it (i.e we need to open the box and check if the value is there or not)
//We can do this by using an if let

//UNWRAPPING AN OPTIONAL
//1. Read the optional value from the dictionary (opposites["Mario"])
//2. If the optional has a string, unwrap it and let it equal marioOpposite
//3. Run body
//4. Else, run body
if let marioOpposite = opposites["Mario"] {
    print("The mario string is in the dictionary & the value is \(marioOpposite)")
}
else {
print("The mario string is not in the ditionary therefore the value is \(opposites["Mario"])")
}

//Another example
var username : String? = nil //variable username is a string optional type (might be there or not) & is default to nil (not there)

//username = "Peter" set a value / don't for username

if let usernameUnwrapped = username { //unwraps optional username
    print("username has a value and is \(usernameUnwrapped)")
}
else {
    print("No username has been set, value is nil")
}

//Optionals are really important because they tell us for certain if data is present or not
//i.e an optional - data may or may not be there
// a non-optional - data must be there 100%

//Square takes in a real (non-optional) int & returns an int
func square(number: Int) -> Int {
    number * number
}

//Creating an optional int default to no value
var optionalNum : Int? = nil

//Swift will not let us run this code because we haven't unwapped the optional (i.e, the square function requires a non-optional Int whearas were trying to pass in an Int?

//square(number: optionalNum)

if let unwrappedNum = optionalNum { //Unwrapps the Int? & creates an Int, then calls function
    print(square(number: unwrappedNum))
}
else {
    print("No value has been set")
}


//NAMING CONVENTIONS
//Normally this: if let unwrappedVar = optionalVar {
//Is conventionally written as: if let var = var {


//2. UNWRAPPING OPTIONALS WITH GUARD
//There is another way in which we can unwrap optionals - using guard
 
//printSquare takes in an optional int (might be a value or might be nil)
func printSquare(of number: Int?) {
    guard let number = number else { //guard check checks if the optional is there & unwraps if so
        print("Missing input") //If the optional is not there, guard check prints missing input & returns (bails out) of func
        return
    }
    print("\(number) times \(number) = \(number * number)")
}

//Difference between guard & let
var myVar : Int? = 3

if let unwrappedVar = myVar {
    //If value is present, unwrap & run the body here
}
func someImportantFunc() {
    guard let unwrappedVar = myVar else {
        //If no value is present, then run the body here & return (bail out of the current scope/function)
        return
    }
}

//Guard is good because it lets us check that our data is valid before we proceed. If it isn't it bails out & returns straight away

//1. Guard requires a return value if a guard checks conditions fail
//2. If the optional is unwrapped & valid, it remains in scope to be used after the guard function


//Guard let vs if let
//Use if let to unwrap optionals & process the optional
//Use guard let for safety to ensure the optionals have a value & exit if not


//3. UNWRAPPING OPTIONALS WITH THE NIL COALESCING OPERATOR
//There is a 3rd way to unwrap optionals

//String:String dictionary with football teams and their captains
let captains = ["Leeds United": "Liam Cooper", "Manchester United" : "Harry Maguire", "Argentina": "Lionel Messi"]

//If we wanted a new captain of chelsea, it wouldn't be in the dict therefore, newCap would be set to a string optional with a value of nil
let newCap = captains["Chelsea"]

//To unwrap this string optional we can use the nil coalescing operator ?? to give a default value to newCap, if the value is not in the dictionary

let chelseaCap = captains["Chelsea"] ?? "N/A" //if there is a value for chelse captain, unwrap & set it to that. Otherwise, set to a string "N/A"
//Either outcome for this results in the optional being unwrapped as a real string will be set either way
//This ?? operator can be used on any optional

//Example 2
let tvShows = ["Got","Simpsons","Breaking Bad"] //array of tv shows
let favouriteShow = tvShows.randomElement() ?? "None" //Chooses a random element from the tvShows array. If there are no elemenets, set favouriteShow to None

//Example 3
//Book struct with name & optional author
struct Storybook {
    let name: String
    let author: String?
}

let newBook = Storybook(name: "Jungle Book", author: nil) //New book with no author
let author = newBook.author ?? "Anonymouse" //Set a variable named author to the author in the book struct. If there is no value, set to anonymouse

//Example 4
//We can use the operator to set default values (Converting from strings to ints)
let input = "" //Lets user put in a string number
let number = Int(input) ?? 0 //Tries to convert string number into an int. If there is no conversion (nil) set nils to 0



//OPTIONAL CHAINING
let names = ["Bran", "Arya", "Robb", "Sansa"] //array of names
let chosenOne = names.randomElement()?.uppercased() ?? "Nobody" //?... reads as if it has a value, unwrap it and then...
//Choose a random element from the names array. Unwraps it and then uppercases.

//If anywhere in the chain of ?. we get a nil value, then the optional returns the coalescing defalt value

//Harder example of optional chaining
//Imagine we wanted to check
//1. If a specific book is present
//2. If the book has an author or not
//3. If the book has an author, is the string empty or does it have values
//4. If the authors name is there, make it uppercased

struct Novel {
    let title: String
    let writer: String? //Might have a value or might not
}

let novel: Novel? = nil

//To check the conditions we can write
let writer = novel?.writer?.first?.uppercased() ?? "A"

//"If we have a novel and the book has a writer & the writer has a first letter, then uppercase, otherwise set the writer to A


//HANDLING FUNCTION FAILURE WITH OPTIONALS
//When we call a function that might create errors, we use the try keyworks & and handle the errors

//If we just want to know if a function has succeeded or failed, we can use an optional try (try?) to try the function.
//If the function runs without any errors, the optional will contain the return value
//If the function has errors, it will return nil
//This means we don't know what the error was, just that an error was thrown

//List of errors that follow the error protocol
enum UserError : Error {
    case badID, networkFailure
}

//A get user function that takes in an ID & can throw errors. Returns a string
func getUser(id: Int) throws -> String {
    //The function always throws an error (test purpose)
    throw UserError.networkFailure
}

//Try the getUser function. If there are no errors, return the user id string & set to user.
//If an error is thrown, it will return nil
if let user = try? getUser(id: 35) {
    print("User: \(user)")
}

//Unwrapping using nil coalescent
let user = (try? getUser(id:35)) ?? "Anonymous" //try the getUser function to return a string value. If an error is thrown (nil) then set the user to anonymous
print("User: \(user)")



//CHECKPOINT 9
//randInt takes in an optional int array & returns an Int
func randInt(numbers: [Int]?) -> Int{
    //Checks if the numbers arry is there, then takes a random element. If number array is not there, return a random num from 1 to 100
    return numbers?.randomElement() ?? Int.random(in: 1...100)
}

print(randInt(numbers: []))
print(randInt(numbers: [5,10,32,27,81]))


