import Foundation

//Protocol extensions are as they sound, we can add functionality/protocols to existing protocols

//Lets assume we want to create a new method for arrays
//.isEmpty is an existing method for arrays

//Statement to check if somebody has any pets & if so, print how many
let pets = ["Dog","Cat", "Rabbit"]

if pets.isEmpty == false { //or !pets.isEmpty
    print(pets.count)
}

//Some people don't like how !pets.isEmpty or pets.isEmpty == false reads
//Instead we can add our own cumputed property to the array type by using an extension that reads better

//Extending the array type by adding a isNotEmpty bool
extension Array {
    var isNotEmpty : Bool {
        return isEmpty == false //returns the opposite of isEmpty which is already a property of the Array type
    }
}

print(pets.isNotEmpty) //true

//Here we have extended the basic functionality of Array types by adding our own computed property that is easier to read

//PROTOCOL EXTENSIONS
//Above we have created this custom computed property on Arrays, but what if we wanted to do the same for dictionarys/tuples etc.
//Dictionaries & tuples both also conform to a protocol called "Collections"
//Therefore, both contain the isEmpty property.
//Therefore, instead of adding the extension to the Array types, we could add it to the Collections protocol & have it available for all collections (arrays, tuples, dictionaries etc)

//Extends on everything in the collection protocol
extension Collection {
    var isNotEmpty : Bool {
        return isEmpty == false //returns the opposite of isEmpty which is already a property of the all types that follow the collection protocol
    }
}

let dict = ["Dom" : 24, "Peter" : 75]
print(dict.isNotEmpty)


//ADDING DEFAULT FUNCTIONALITY TO PROTOCOLS USING EXTENSIONS
//By default, protocols have no functionality but by using exensions we can create default implementation

//Creating a Person protocol - everything conforming must have a name and a say hello function
protocol Person {
    var name : String {get}
    func sayHello()
}

//An extension on the person protocol to give a default implementation for sayHello for everything conforming to the Person protocol
extension Person{
    func sayHello() {
        print("Hello I'm \(name)") //name must be present in all Person protocols so is pulled from there
    }
}

//Now all conforming types have this sayHello function by default so don't need to add their own
//This is called apples "Protocol oriented programming"

struct Workers : Person { //A new workers struct that is conforming to the Person protocol
    //Remember all those conforming to the Person protocol must have a name and a sayHello function but we have just create a default one by extension
    let name : String
}

let builder1 = Workers(name: "Peter") //Creating a new instance of a worker
print(builder1.name) //Name comes from setting the name - required by protocol
builder1.sayHello() //<- function comes from the default extension on the protocol


//CHECKPOINT 8

//Creating the Building protocol with all required properties & methods to be conformed to
protocol Building {
    var rooms : Int {get}
    var cost : Int {get}
    var estateAgent : String {get}
    func summary() -> String
}

//Creating default functionality for the summary of buildings by using an extension on the protocl
extension Building {
    func summary() -> String {
        "This building has \(rooms) rooms, costs £\(cost) and is managed by \(estateAgent)"
    }
}

struct House : Building {
    var rooms : Int
    let cost : Int
    let estateAgent : String
    
}

struct Office : Building {
    let rooms : Int
    let cost : Int
    let estateAgent : String
}

var bungalow = House(rooms: 3, cost: 100_000, estateAgent: "X92")
print(bungalow.estateAgent)
bungalow.rooms = 4
print(bungalow.summary())


let DMS = Office(rooms: 7, cost: 250_000, estateAgent: "Unknown")
print(DMS.summary())

