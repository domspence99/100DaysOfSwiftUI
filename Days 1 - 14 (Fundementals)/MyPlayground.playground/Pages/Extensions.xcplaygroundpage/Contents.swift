import Foundation

//Extentions allow us to add functionality to any type, whether its something we've created or has come from a plugin etc

//For example, if we want to add functionality to Apples String type, we can do it by using an extension

//Lets take a simple string
var quote = "   This is a string with a lot of whitespace  "

//To remove this whitespace we could use built in functions already
let newQuote = quote.trimmingCharacters(in: .whitespacesAndNewlines)
print(newQuote)

//Alternatively we could create a function to remove whitespace from a string
func removeWhitespace(_ string: String) -> String{ //Accepts a string & returns a string
    string.trimmingCharacters(in: .whitespacesAndNewlines)
}
print("Removed by function: " + removeWhitespace(quote))
//This works but there is a better way to do it by using extensions

//EXTENSION
extension String { //Initiating an extension to the string type
    func trimmed() -> String { //Adding a remove whitespace function that returns a string
        self.trimmingCharacters(in: .whitespacesAndNewlines) //self. as were in the String type & removing whitespace
    }
}
print("Removed by extension: " + quote.trimmed())
//Although they do the exact same thing, using an extension is better because:
//1. We don't have to create a global function to achieve the goal. Meaning it's less messy & less accessible (internal access)
//2. By adding it to the extension, we can do string. and it will bring up a list of methods for all strings including our extension
//3. Grouped with the data type


//Using extensions also means we don't have to assign a new variable to the new string as the we can create another extension that calls the previous removewhitespace method & trims itself & mutates its own value for the future

extension String {
    mutating func trim() { //creates a mutating function that can change its own velue
        self = self.trimmed() //calls the previous method to remove the whitespace and sets the variable to the new trimmed output
    }
}

quote.trim() //this mutates the actual quote variable and replaces it with the trimmed whitespace
print("Variable after mutation: " + quote)

//** NAMING CONVENTIONS
//1. FUNCTION FOR COMPUTING THE OPERTION (I.E TRIMMING A STRING) IS NAMED TRIMMED "ED" (SORTED)
//2. MUTATING FUNCTION THAT UPDATES THE VALUE (I.E TRIM) IS NAMED -"ED" (.SORT())


//ADDING PROPERTIES TO EXTENSIONS
//We can add properties to extensions however we can only add computed properties, not stored properties.
//If we added a stored value to the Int struct for example, every time we created an int, we would also have to create extra storage for the stored property that has been added to every Int - huge problem

//Adding computed properties to the string type
extension String {
    var lines: [String] { //lines returns an array or strings
        self.components(separatedBy: .newlines) //seperates the string at every new line and adds new line to array & returns
    }
}

let lyrics = """
I believe I can fly
I believe I can touch the sky
I can't remember the rest
The end
"""

print(lyrics.lines.count)
print(lyrics.lines[1])


//CUSTOM INITIALISERS USING EXTENSIONS
//By default, when we create structs, if we don't specify initialisers, swift will do that anyway for us

struct Book {
    let title : String
    let pageCount : Int
    let readingHours : Int
}

let lotr = Book(title: "Lord of the rings", pageCount: 800, readingHours: 24) //<- Swift automatically gives us memberwise initialisers that we must input

//If assigned our own custom initialisers, swift doesn't provide this as it wants us to assign our data based on custom logic
//i.e

struct Book2 {
    let title : String
    let pageCount : Int
    let readingHours : Int
    
    init(title: String, pageCount: Int, readingHours: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 10 // <-- Custom logic for assigning reading hours
    }
}
//If swift were to keep the memberwise initialiser, it would allow the user to set a value & skip over our custom logic for assigning the reading hours

let got = Book2(title: "got", pageCount: 900, readingHours: 4)
print(got.readingHours) //returns 90 <- now our custom logic is being run but the member initialiser has been disabled

//Sometimes we want both functionalities, whereas we can have our custom logic & be able to overwrite it
//This is where extensions can help

//If we put our custom initialiser inside an extension, then swift will allow us to have our memberwise initialisers & ben able to have our custom logic

//Adding the initialisers by extension to the first book struct
extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
    
}

let harryPotter = Book(title: "Harry Potter & The Order of the Phoenix", pageCount: 740)
print(harryPotter.readingHours) //14 hours <- Set by the custom initialiser
let harryPotter2 = Book(title: "Harry Potter & the Chamber of Secrets", pageCount: 450, readingHours: 7)
print(harryPotter2.readingHours) //7 hours <- Srt by the member initialiser


