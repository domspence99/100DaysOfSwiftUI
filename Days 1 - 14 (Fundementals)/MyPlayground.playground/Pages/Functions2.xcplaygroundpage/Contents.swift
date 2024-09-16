import Foundation

//ADDING LABELS TO FUNCTION PARAMETERS/ARGUMENTS
//"for" and "to" become the label parameters
//REMEMBER we can eliminate these labels completely by using _

//USING DEFAULT VALUES FOR PARAMETERS
//In this example, we can use a default end point of e.g 12 and also allow the user to state a desired endpoint
func printTimesTable(for number: Int, end multiplier: Int = 12) {
    //the end multiplier = 12 makes the end parameter 12 if not end point is stated
    for i in 1...multiplier {
        print("\(i) * \(number) is \(i*number)")
    }
}

printTimesTable(for: 8, end: 20) //calling with end parameter
printTimesTable(for: 8) //calling without end and assuming default value of 12


//ERROR HANDLING IN FUNCTIONS
//1. Defining password error enum with type Error
enum passwordError: Error {
    case tooShort, tooSimple
}

//2. Defining checkPassword
//throws checks for errors and exits code if error is seen
func checkPassword(_ password: String) throws -> String {
    //checks for error conditions and throws error
    if password.count < 5 {
        throw passwordError.tooShort
    }
    if password == "12345" {
        throw passwordError.tooSimple
    }
    
    //if no errors are seen, inform user on password strength
    if password.count < 8 {
        return "Okay"
    }
    else if password.count < 10 {
        return "Good"
    }
    else {
        return "Excellent"
    }
}

//3. function to handle the thrown errors
//we use a do, try, catch method to handle the errors

do {
    //try must be written before all throwing functions
    let passwordStrength = try checkPassword("12345") //tries condition & proceeds if no errors
    print("Password strength is \(passwordStrength)")
}
catch passwordError.tooShort { //catches too short error
    print("Password is too short") //what happens if theres an error
}
catch passwordError.tooSimple {
    print("Password is too simple")
}
catch {
    print("This catches all errors")
}


//FUNCTIONS CHECKPOINT 3
//Accept any number between 1,,,10,000 & return sqrt, throw error if oob & not integer sqrt

//1. Define error cases
enum squareRootErrors : Error {
    case outOfBounds, noRoots
}

//2. Create function to complete square root and check for errors
func squareRoot(_ number: Int) throws -> Int {
    if (number < 1 || number > 10_000){
        throw squareRootErrors.outOfBounds
    }
    else { //check for square root & return root integer
        for i in 1...100 { //100^2= 10_000
            //print(number/i)
            if (i*i == number){
                print("\(i) is the square root")
                return i
            }
        } //if after the check it can't find a root, send error
        throw squareRootErrors.noRoots
    }
}

//3. Try the function and catch the errors
do {
    let root = try squareRoot(100)
}
catch squareRootErrors.outOfBounds{
    print("Number is out of bounds")
}
catch squareRootErrors.noRoots {
    print("There are no real integer roots for this number")
}

