import Foundation

//STRUCTS
//Structs let you define your own custom data type e.g.

//Structs are capitalised by convention
struct Album {
    //variables inside the struct
    let title: String
    let artist: String
    let year: Int
    
    //functions inside the struct
    func printAlbum() {
        print("Title: \(title), Artist: \(artist), Year: \(year)")
    }
}
//creating new album type
let Thriller = Album(title: "Thriller", artist: "Michael Jackson", year: 1990)

//accessing data and functions from the album type
print(Thriller.artist)
print(Thriller.year)
Thriller.printAlbum()

//Example of another struct
//Struct contains an employee, vacation days and a check to see if you can take vacation with days remaining
struct Employee {
    //PROPERTIES OF STRUCT
    let name: String
    var vacationRemaining = 10 //: Int // setting to 10 sets as default
    
    //Because within this function we are trying to alter the data contained within the struct (vacationRemaining) we need to tell swift that this function is a mutating function and is allowed to do that
    //METHODS OF STRUCT
    mutating func takeVacation(daysRequested: Int) {
        if daysRequested < vacationRemaining {
            vacationRemaining -= daysRequested
            print("Were going on holiday. \(vacationRemaining) days of holiday left")
        }
        else {
            print("Not enough days remaining")
        }
    }
}

//If we try set Dom as a constant "let" swift won't allow us because by calling the takeVacation we are in turn altering the data within the struct therefore the initialized cannot be constant

//CREATING AN INSTANCE OF STRUCT
var Dom = Employee(name: "Dom", vacationRemaining: 14)
Dom.takeVacation(daysRequested: 7)



//DYNAMIC AND STORED PROPERTY VALUES
//Stored - set data that is read and manipulated as normal
//Dynamic - data that is manipulated on struct call & is read/written using getters and setters


//Same example as above but now using days remaining as a dynamic property

struct dynamicEmployee {
    let name: String
    var daysAllocated = 14 //defaulted to 14
    var daysTaken = 0 //defaulted to 0
    
    //dynamic property calculates days remaining from other properties
    var daysRemaining: Int {
        //What happens when we try read daysRemaining
        get{
            daysAllocated - daysTaken
        }
        //what happens when we try alter days remaining
        set{
            //if we modify days remaining, the allocated amount is the days that have been taken + the new amount of days left
            //new value is the value that will be set by: daysRemaining = 4, this alterz the days allocated
            daysAllocated = daysTaken + newValue
        }
    }
}

var Dominic = dynamicEmployee(name: "Dominic", daysAllocated: 14, daysTaken: 3)

print(Dominic.daysRemaining) //caulcuates 14-3
Dominic.daysTaken += 4
print(Dominic.daysRemaining) //recalculates 11-4
Dominic.daysRemaining = 20 //Sets days remaining as 20
print(Dominic.daysTaken) //Shows still 7 days taken
print(Dominic.daysAllocated) //Shows that by setting 20 days remaining that I must have had 27 allocatedm(20r + 7 taken)

//* In order to read/write data from dynamic properties we must use a get/set for swift to know what were receiving and how were setting these properties
//* i.e if we were to try set daysRemaining to 4, swift wouldn't know whether to increase daysAll or daysTaken to make that change


//PROPERTY OBSERVERS
//Property observers are pieces of code that are executed just before and just after a property inside your struct has changed e.g

//Imagine if you had a scoreboard & you wanted to print the new score every time it changes, you can use a property observer

struct Scoreboard {
    var score: Int = 0 { //defaulted to 0 on instance
        //Executed before the property is actually changed
        willSet {
            print("score before property change is \(score)")
            print("score after property change will be \(newValue)")
        }
        //Executed after the property is changed
        didSet {
            print("score after property change is \(score)")
            print("score before property change was \(oldValue)")
        }
    }
}

var scoreboard = Scoreboard()
scoreboard.score += 1 //the change of score var in struct triggers the will/didSet property observers


//CUSTOM INITIALISERS
//By defualt, when we create a struct and an instance, swift will automatically instantiate the instance and set the parameter inputs = to the property variables inside the struct
//We can change this though by creating a custom initialiser

//We need to ensure that if we use a custom initialiser that every property is initialised otherwise the code wont run

struct Person {
    var name: String
    var age: Int
    
    //This is exactly what happens automatically if we don't change the initialiser
    init(name: String, age: Int) {
        //self refers to propery name inside the struct
        //set the property name inside struct = to the parameter input from the instance
        self.name = name
        self.age = age
    }
}

//We can also change the initialiser names as follows
struct Parent {
    var person: String
    var numberOfKids: Int
    
    //notice the initialiser names take in parent + kids but are set to the struct property values as person + number or kids
    init(parent: String, kids: Int) {
        self.person = parent //don't need self. but helps understand which is which
        numberOfKids = kids
    }
}

let Dad = Parent(parent: "Father", kids: 2)
print("\(Dad.person) + \(Dad.numberOfKids)")


//We can also perform operations inside the initialiser to set other struct property values

struct CountryMetric {
    var countryName: String
    var usesMetres: Bool
    
    //As you can see in the initialiser, it only takes in the country parameter but sets the usesMetres property within the initialiser
    //*REMEMBER YOU NEED TO SET A VALUE FOR EVERY PROPERTY IN THE STRUCT IN THE INITIALISER OR THE CODE WONT RUN
    init(country: String) {
        countryName = country //country name in struct is set to parameter country that is passed in
        
        //Helps set the usesMetres property
        let countriesUsingMetres = ["UK","USA","Australia"]
        //If the passed in country is within the usesMetres array then set usesMetres to true/false
        if countriesUsingMetres.contains(country){
            usesMetres = true
        }
        else {
            usesMetres = false
        }
    }
}

let spain = CountryMetric(country: "Spain")
print(spain.usesMetres) //returns false

let uk = CountryMetric(country: "UK")
print(uk.usesMetres) //returns true
