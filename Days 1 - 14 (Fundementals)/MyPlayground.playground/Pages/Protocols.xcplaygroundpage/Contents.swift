import Foundation

//Protocols let us define properties and methods that must be adhered to within our code.
//They don't specify what the properties and methods are/do but only that we must have them in our code

//This is a protocol for a vehicle, it says that somewhere in the code, we are required to define code for estimated time & distance & that we must adhere to the parameters & return types
protocol Vehicle {
    var name: String {get} //Vehicles conforming to the protocol must be inculde a name and it must be readble
    var noOfPassengers: Int {get set} //Vehicles conforming to protocol must include noOfPassengers & it must be readable & writable
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

//We can now design types that adhere to our protocol
struct Car : Vehicle { //The structure car must conform to the vehicle prototype & include the required functions
    //Including the protocol properties
    let name = "Car"
    var noOfPassengers = 1
    //Including the protocol functions
    func estimateTime(for distance: Int) -> Int {
        distance/50 //return an integer for time that is equal to the distance passed in /50
    }
    func travel(distance: Int) {
        print("We drove \(distance) kilometers")
    }
    
    //Inside the struct we can also add extra functions that aren't in the protocol
    func openSunroof(){
        print("Its hot outside")
    }
}

//We can now use the vehicle protocol to give commute information for somebodys journey using a car
//Creating a new function that can be used on any structs that adhere to the vehicle protocol

//**using vehicle: Vehicle enables us to pass in any type that adheres to the vehicle protocol**

func commute(distance:Int, using vehicle: Vehicle) { //a new function commute that accepts an int named distance & any struct/type that adheres to the Vehicle protocol named vehicle
    if vehicle.estimateTime(for: distance) > 100 { //using the car structs functions to calculate estimated time using distance parameter
        print("Vehicle is too slow, try another one")
    }
    else {
        vehicle.travel(distance: distance)
    }
}

//Creating an instance of the car struct
let mySubaru = Car()

//Calling the commute function to check on mySubaru commute information
commute(distance: 500, using: mySubaru) //calling commute function and passing mySubaru car struct
//commute(distance: 10_000_000, using: mySubaru) //calling commute function and passing mySubaru car struct


//At this point, the protocol isn't really doing much. If you remove the protocol, the commute function would still work
//However, by using a protocol, we don't have to specifically pass in the Car srtuct into the commute function.
//We could pass in the protocol itself Vehicle, & any consequent structs that conform to the Vehcile protocol will be accepted and will run.
//For example, we can add a train struct that conforms to the Vehicle protocol & the commute function would also allow that code to be run.

//Creating a train struct that conforms to the Vehicle protocol
struct Train : Vehicle {
    //Including the protocl properties
    let name = "Train"
    var noOfPassengers = 1
    //Including the protocol functions
    func estimateTime(for distance: Int) -> Int {
        distance/10 //return an integer for time that is equal to the distance passed in /50
    }
    func travel(distance: Int) {
        print("We journeyed \(distance) kilometers on the train")
    }
}

//Now we can create an instance of a train
let northernRail = Train()

//Now we can call the commute function again but this time pass in a Train type/struct that also adheres to the vehicle protocol
commute(distance: 200, using: northernRail)

//This is powerful as it allows us perform similar functionality on a range of different types/structs all from the same function

//As we know that every vehicle must contain the estimate travel & travel functions, we can create another function that takes all possible Vehicles & calculates the fastest travel type

func getEstimatedTravelTimes(distance: Int, using vehicles: [Vehicle]){ //function accepts distance & and array of Vehicles that conform to the Vehicle protocol
    
    //Loops through every vehicle type & performs estimateTime function
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance) //estimate time returns a time estimate
        print("\(vehicle.name) took an estimate travel time of \(estimate) hours") //print results
        
    }
}

getEstimatedTravelTimes(distance: 100, using: [northernRail,mySubaru])

//Again this is super powerful as we have passed in an array of multiple different types & structs, & because we know they all adhere to the vehicle protocol, we can organise through the data like this.
