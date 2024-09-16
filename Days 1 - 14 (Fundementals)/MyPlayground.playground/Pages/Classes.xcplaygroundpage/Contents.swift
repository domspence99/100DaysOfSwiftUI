import Foundation

//CLASES
//Classes are similar to struct whearas they have their own properties and methods however classes also have inheritance meaning instances can adopt previously written code from children or parent classes

//Again classes are used to create custom data types

//Similarities with structs:
//1.Can create custom properties, methods, property observers and access control
//2.Can create custom initialisers to configure each instance

//Differences to structs
//1. Classes inherit addiontional functionality from another class (can also overide sellective functionalities
//2. Doesn't automatically create initialiser (need to initalise all values or set default values)
//3. Copies of an instance of a class change both sets of data (i.e if you change a property in one instance then the copied instance property value will also change)

//Class example (inheriting from parent)

//Parent class with 1 variable
class Employee {
    var hours: Int
    init(hours: Int) {
        self.hours = hours
    }
    
    //Function available to this class & all child classes
    func printDailySummary(){
        print("Today I worked for \(hours) hours")
    }
}

//Child class (inherits hours variable from parent "Employee" class)
//final class means nothing can inherit from this class (i.e its the end of the inheritance line and you cant do some class : Developer)
final class Developer : Employee {
    func work() {
        print("I'm a developer and I work \(hours) hours")
    }
    
    //override func takes a parents function and overrides it with this new function
    override func printDailySummary() {
        print("Today I worked on software for \(hours) hours")
    }
}

//Another child class that also inherits from Employee
final class Manager : Employee {
    func work() {
        print("I'm a manager and I work \(hours) hours")
    }
}

//Creating instance of developer and passing in hours -> parent class
let dom = Developer(hours: 8)
let adam = Manager(hours: 10)
dom.work() //Developer work function
adam.work() //Manager work function
dom.printDailySummary() //Overriden Employee function
adam.printDailySummary() //Original Employee parent function


//INITIALISERS WITH CLASSES
//Remeber classes never automaically create initialisers for properties so you must always set your initialisers for the code to work

//Parent class
class Vehicle {
    var isElectric : Bool
    //Initialising parent class
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

//Child class - has to include all parent initialisers
class Car : Vehicle{
    var isConvertable : Bool
    
    //IN THE INITIALISER WE HAVE TO PROVIDE AN INITIAL VALUE FOR THE SUPER/PARENT CLASS AS IF CALLED FROM CAR IT WONT HAVE AN INITIAL VALUE
    init(isElectric: Bool, isConvertable: Bool) {
        self.isConvertable = isConvertable //Initialising property from car class
        super.init(isElectric : isElectric) //Initialises isElectric property from the super/parent class (property name : value)
        
        //*super. allows us to call methods from the super class, in this case we called the init method and provided the isElectric initialiser
    }
}


let porsche = Car(isElectric: true, isConvertable: false)
print(porsche.isConvertable)
print(porsche.isElectric)


//COPIES OF CLASSES
//Copies of classes SHARE DATA therefore if you copy a class and change a property then the properties will be changed across all copies of the class i.e

//1. Creating a user class with 1 property of username
class User {
    var username = "Undefined"
}

var user1 = User() //creating an instance of class
var user2 = user1 //copying the instance of the class
user1.username = "domspence99" //changing only 1 of the classes properties

print(user1.username) //domspence99
print(user2.username) //domspence99
//See how the username changes in both instances of the class although only 1 was changed in code
//This is because classes are references and point to a specific point of data in memory
//If this was a struct instead of a class then the copied property would not change

//If you want to create a new unique copy of a class then you can add in a copy function into the class that creates a unique copy and copies all the properties into a new class
//e.g. inside class User create a function:
// func copy -> User {
//  let user = User()
//  user.username = username
//  return user
//  }

//then use the function to create a copy
//e.g. var user2 = user1.copy()


//De-initialisers
//De-initialisers are like initialisers in that that are triggered automatically whenever the last copy of the class is destroyed

//Examples of a class being destroyed is when a struct is used in an if/for loop and is not stored elsewhere. After the loop finishes execution and exits the loop scope it is destroyed and the deinitialiser will be triggered. e.g

class UserId {
    var id : Int
    
    init(id: Int) {
        self.id = id
        print("User \(id) has been created")
    }
    
    deinit {
        print("User \(id) has been destroyed")
    }
}

for i in 1...3 {
    let user = UserId(id : i) //Creating instances of the class inside a for loop
    print("User \(user.id) created in loop")
    
} //once the instance of that class has exited the for loop scope it will then be destroyed(deinit will be triggered) becuase the instance of the class user is only alive in the loop
//We could keep the instances alive by storing them in an array external to the loop

//REMEMBER: this only happens when the last reference of the class is destroyed. If the class instance is stored elsewhere (i.e in an array) then the class won't be destroyed as it is still stored somewhere in memory


//WORKING WITH VARIABLES INSIDE CLASSES

//Everytime we create a new instance of a class we create a new object. Imagine a sign post pointing at the object.

//Creating a user class with a variable name
class Person {
    var name = "Peter"
}

let person1 = Person() //Creates an instance of person. (Object is created called person1 and "sign points at the object)
//If we want to change person1 name, we can because name is variable. This doesn't change the sign. It still points at person1 but we have just changed his name
person1.name = "John"
print(person1.name)
//If the name property inside Person was constant - let - we would not be able to do this

//If we wanted to create a copy of this person1, we would have to make the person1 a variable & copy the class.

class Human {
    var name = "Steven"
}

var human1 = Human() //creates a variable instance of human1
human1.name = "Paul"
print(human1.name) //paul
human1 = Human() //creates a new instance of human1
print(human1.name) //Steven
//When human1 was recreated, the property was overriden with the default proroperties


//We have 4 options

//1. Constant class instance with constant properties (i.e let person1 & inside the class let name)
//This means we cannot change/copy the instance & we can't change the property inside
//The signpost always points at the same person object & always has the same name

//2. Constant class instance with variable properties (i.e let person1 & var name)
// We can't change/copy the instance but we can change the property inside
// The signpost always points at the instane but the values inside can change

//3. Varibale class instance with constant properties (i.e var person1 & let name)
//We can change/copy the instance but we can't change the value inside
//The signpost can point at different people but the values inside are all the same

//4. Varibale class instance with variable properties (i.e var person1 & var name)
//We can change/copy the instance & we cant change the value inside
//The signpost can point at different people and the values inside can change


//This is different to structs as structs contain their whole information inside the struct.
//Therefore if you change values inside a struct, you change the whole struct itself as all the data is encapsulated inside the struct

//CHECKPOINT 7

//Creating a parent class of animal with a number of legs property
class Animal {
    let legs: Int
    
    //Initialising legs property
    init(legs: Int) {
        self.legs = legs
    }
}

//Creating a dog subclass of an animal
class Dog : Animal {
    //Creating a barking function
    func speak() {
        print("WOOOF!!")
    }
}

//Creating a corgi subclass of dog
final class Corgi : Dog { //last class line of dogs
    //Creating a unique speak function for corgis
    override func speak() {
        print("WOOF IM A CORGI")
    }
}

//Creating a poodle subclass of dog
final class Poodle : Dog { //last class line of dogs
    //Creating a unique speak function for poodles
    override func speak() {
        print("WOOF IM  A POODLE")
    }
}

//Creatig a cat subclass of animal
class Cat : Animal {
    //Creating an is tame bool property
    let isTame: Bool
    
    //Initialising isTame bool
    init(isTame: Bool, legs: Int) {
        self.isTame = isTame
        super.init(legs: legs) //initialiser for the parent class property legs
    }
    //Creating a speak function for cats
    func speak() {
        print("MEOW")
    }
}

//Creating a persion cat class that inherits from cat that inherits from animal
final class Persian : Cat {
    //Creating a speak function specifically for a persian cat
    override func speak() {
        print("MEOW IM A PERSIAN CAT")
    }
}

//Creating a lion cat class that inherits from cat that inherits from animal
final class Lion : Cat {
    //Creating a unique speak function specifically for a lion that overrides cat class speak function
    override func speak() {
        print("ROAR IM A LION")
    }
}

let animal = Animal(legs: 4)
print(animal.legs)

let dog = Dog(legs: 4)
print(dog.legs)
dog.speak()

let corgi = Corgi(legs: 4)
print(corgi.legs)
corgi.speak()

let poodle = Poodle(legs: 4)
print(poodle.legs)
poodle.speak()

let cat = Cat(isTame: true, legs: 4)
print(cat.legs)
print(cat.isTame)
cat.speak()

let persian = Persian(isTame: true, legs: 4)
print(persian.legs)
print(persian.isTame)
persian.speak()

let lion = Lion(isTame: false, legs: 4)
print(lion.legs)
print(lion.isTame)
lion.speak()
