//defining an enum
enum Transport {
    case flight, train, car, bus, taxi
}

var mode = Transport.flight

//this switch is basically saying:
//if mode == flight, do etc, if mode -- train do etc ...
switch mode {
case .flight:
    print("Get on the plane")
    //fallthrough allows the switch statement to proceed through the code and execute the cases underneath it
case .train:
    print("Get on the train")
    //fallthrough
case .car:
    print("Get in the car")
case .bus:
    print("Get on the bus")
case .taxi:
    print("Get in the taxi")
default:
    print("No method of transport selected") //if none of the cases match the mode of transport
}

//conditional ternary operator
var temperature = 23
print(temperature > 18 ? "Hot" : "Cold")
//if temp > 18, print hot if true, cold if false
//basic if else statement

