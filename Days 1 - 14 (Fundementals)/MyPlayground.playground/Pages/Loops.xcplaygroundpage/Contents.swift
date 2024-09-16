//LOOPS

//LOOPING THROUGH AN ARRAY
let array1 = ["Tom","Dom","Tommy"]

for names in array1 {
    print(names)
}
//for variable in array, loop through


//LOOPING OVER A RANGE OF NUMBERS
for i in 1...12 { //including 1 and 12
    print(i)
}

for j in 1..<10 { //from 1 to 9 (not including 10)
    print(j)
}


//Using loops without i/j counters
//If you aren't going to be using the counter you can just use a _ to repeat the loop x number of times
var sentence = "Haters gonna "
for _ in 1..<5 { //repeats loop 4 times
    sentence += "hate "
}
print(sentence)


//WHILE LOOPS
var countdown = 10

while countdown >= 0 {
    print("Blast off in \(countdown)")
    countdown -= 1
}

//RANDOM NUMBERS
var dice = 0
while dice != 20 {
    dice = Int.random(in: 0...20)
    print("Rolled: \(dice)")
}
print("You rolled a 20")


//USING BREAK AND CONTINUE IN LOOPS
var files = ["notes.txt","photo.jpg","photo2.jpg"]

//finding all jpg files in array
for file in files {
    if file.hasSuffix(".jpg") == false{
        continue //at the continue point, it stops there and returns to the next file in the loop
        //break // stops there and exits the loop completely
    }
    print("\(file) is a photo" )
}

//finding 10 multiples of 2 numbers
let number1 = 3
let number2 = 13
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2){
        multiples.append(i)
        if multiples.count == 10 {
            print(multiples)
            break
        }
    }
}

//continue skips remaining current loop itteration and moves onto next itteration
// break skips remaining loop itteration and all subsequent itterations


//CHECKPOINT 3
for i in 1...100{
    if i.isMultiple(of: 3) && i.isMultiple(of: 5){
        print("FizzBuzz")
    }
    else if i.isMultiple(of: 3){
        print("Fizz")
    }
    else if i.isMultiple(of: 5){
        print("Buzz")
    }
    else {
        print(i)
    }
}


