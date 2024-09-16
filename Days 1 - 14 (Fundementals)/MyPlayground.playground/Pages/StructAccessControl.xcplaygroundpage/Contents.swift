import Foundation

//ACCESS CONTROL

//In a lot of circumstances within our code, we want to create struct but restrict certain properties and methods to be called/accessed by the user/anywehere else in the code i.e

struct BankAccount {
    private(set) var funds = 0 //allows the property to be read but not changed from outside the struct

    mutating func makeDeposit(depositAmount: Int) { //mutuating func as this func alters the property value
        funds += depositAmount
    }
    
    mutating func makeWithdrawal(withdrawalAmount: Int) -> Bool {
        //if funds are available:
        if funds >= withdrawalAmount{
            funds -= withdrawalAmount
            return true
        }
        else{
            return false
        }
    }
    
}

var account = BankAccount() //instantiates new account
account.makeDeposit(depositAmount: 100) //adds 100
print(account.funds) //returns 100
account.makeWithdrawal(withdrawalAmount: 50) //withdraw 50
print(account.funds) //prints 50 balance

//This code works perfectly however with this struct there is nothing stopping the user to access the funds property directly and increasing the funds to give themselves more money

//account.funds = 1_000_000 //not allowed due to private(set)
print(account.funds) //allowed due to private(set)


//to prevent this we have to use keywords infront of the var property
// 1. private - stops the property from being accessed anywhere outside of the struct
// 2. fileprivate - stops the property from being accessed anywhere outside of the currentfile
//3. public - allows the property to be used from anywhere
//4. private(set) - allows the property to be read from but not changed

//*IF YOU USE A PRIVATE PROPERTY YOU WILL NEED TO USE A CUSTOM INITIALISER AS IT WONT BE ABLE TO BE SET WITHOUT ONE i.e

struct Person {
    private var socialSecurityNumber: String //can't be accessed
    
    //allows the ssn to be set via an internal initialiser
    init(ssn: String) {
        socialSecurityNumber = ssn
    }
}
let sarah = Person(ssn: "555-55-5555")


//STATIC METHODS AND PROPERTIES
//Sometimes we want the methods and properties to belong to the struct and not to the individual instances of the struct. For this we can use static which makes them accessible to the struct itself and not to the various instances

//This makes the static properties and methods available and the same for all individual instances of the struct

struct School {
    //static variable which is the same for all instances of school
    static var numberOfStudents = 0
    //static function available for all instances
    static func addPupil(student: String) {
        print("\(student) joined the school")
        numberOfStudents += 1
    }
}
//Notice how these are called on the struct itself and not an instance of the struct
School.addPupil(student: "Jamie Oliver")
print(School.numberOfStudents)


//Mixing static and non static properties and methods
//We can only access static properties and methods from nonstatic code using the Self property
// self - refers to current value of struct (i.e 55, "hello", true)
// Self - refers to current type of struct (Int, String, Bool)


//Static properties are useful to organise common data within apps i.e
struct AppData {
    static let version = "1.2.4"
    static let saveFileName = "settings.json"
    static let url = "https://mwww.mywebiste.com"
}
//This way anywhere in the program, you can call this struct and get fixed properties everytime
print(AppData.version)

//Static properties are also useful to create examples of your struct

struct Login {
    let username: String
    let password: String
    
    static let example = Login(username: "domspence", password: "Password")
}

//Then anywehere within the code we can call login.example and clearly see the struct
print(Login.example)



//CHECKPOINT 6
print("CHECKPOINT 6")

//Create a car struct with model, seats and current gear
//Create a function to change gear on the car
//Apply access control to properties and methods



//1. Enum for all combinations of gear direction (stops user from entering any other value other than up or down)
enum gearDirection {
    case up, down
}

//2. Create car struct
struct Car {
    
    //3. Private properties for model and seats so it can't be changed outside of the struct once instantiated
    private let model: String
    private let seats: Int
    private(set) var current_gear: Int = 1 { //Defaulted to 1
        //4. Did set on current_gear to print shift change message whenever the current_gear property is changed
        didSet {
            print("Gear has been shifted from \(oldValue) to \(current_gear)")
        }
    }
    
    //5. Initialiser allows the model and seats to be private properties but still set by the initialiser upon instaniation
    init(model: String, seats: Int) {
        self.model = model
        self.seats = seats
    }
    
    //6. Mutating as function changes current_gear variable
    mutating func changeGear(_ direction: gearDirection) {
        //7. Switch statement checks for direction changes (If direction = up/down ->)
        switch direction {
        case .up:
            //8. If current gear less than 6 shift gear otherwise print error
            current_gear < 6 ? current_gear += 1 : print("Can't shift higher than gear 6")
        case .down:
            current_gear > 1 ? current_gear -= 1 : print("Can't shift below gear 1")
        }
    }
}

//9. Creating new instance of a car with initial properties
var ford = Car(model: "Ford",seats: 5) //Creates new instance of car called ford
print("Instance of car is: \(ford)")
ford.changeGear(.down) //Error as cant be lower than 1
ford.changeGear(.up) //Using the struct change gear function
ford.changeGear(.up) //2-3
ford.changeGear(.up) //3-4
ford.changeGear(.up) //4-5
ford.changeGear(.up) //5-6
ford.changeGear(.up) //Error > 6
ford.changeGear(.down) //6-5

//Improvements, could throw error handling into struct whenever the car tries to shift into higher/lower gears






