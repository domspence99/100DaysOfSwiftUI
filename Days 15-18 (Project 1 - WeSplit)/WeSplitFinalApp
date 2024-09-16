//
//  ContentView.swift
//  WeSplit
//
//  Created by Dominic Spence on 31/08/2024.
//

import SwiftUI

//CHECK SPLITTING APP:
//1. USER ENTERS COST OF CHECK
//2. HOW MANY PEOPLE ARE SPLITTING THE CHECK
//3. HOW MUCH TIP THEY WANT TO LEAVE

//FOR THIS WE NEED 3 STATE PROPERTIES (That will change)
//COST, NO_OF_PEOPLE, TIP%

//*Remember $binding properties, will read/write & update themselves, everytime the value changes & @State will reflect the changes on the screen


struct ContentView: View {
    //DEFINING THE 3 STATE PROPERTIES
    @State private var checkAmount = 0.0 //Double variable for cost of bill
    @State private var numberOfPeople = 2 //Sensible defaults
    @State private var tipPercentage = 20
    
    //Focus state designed to handle input focus in SwiftUI (i.e if boxes are active/not)
    @FocusState private var amountIsFocused : Bool
    
    let tipPercentages = [0,5,10,15,20,25] //An array of all the possible tip percentages we want to allow the user to be able to offer
    
    //Computed property for the amount per person
    var amountPerPerson: Double {
        //Calculate the amount per person
        let peopleCount = Double(numberOfPeople + 2) //Convert to double & +2 for real int value vs menu item
        let tipSelection = Double(tipPercentage) //Convert tip % to double
        let tipValue = checkAmount / 100 * tipSelection //Value of tip
        
        return (checkAmount + tipValue) / peopleCount //return amount per person
    }
    
    //Computed property for total check amount
    var totalCheckAmount: Double {
        //Takes the previously calculated tpp & recalculates total check amount
        return amountPerPerson * Double(numberOfPeople + 2)
    }
        
    
    var body: some View {
        NavigationStack{
            Form {
                //Check amount section
                Section("Check amount") {
                    //Text field for entering check amount
                    //Contents of the field is a value(number not text), bound to check amount
                    //Format of the value(number) is of a currency, which we have set to USD
                    
                    //TextField("Please enter check amount", value: $checkAmount, format: .currency(code: "USD"))
                    
                    TextField("Please enter check amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    
                        .keyboardType(.decimalPad) //Forces keyboard to only have numbers & decimal point
                        .focused($amountIsFocused) //Binds the isFocused Bool to focused to check if the text field is active/not
                    //**
                    
                    //Instead of using USD, we check the locale preferred currency of the current user if it has one (?) if not, set to USD
                    //Locale, is a struct full of all the users preffered settings i.e currency, metric, etc
                }
                
                
                //Number of people section
                Section("Number of people splitting the check") {
                    Picker("People", selection: $numberOfPeople) {
                        //Picker selection is bound to the number of people property
                        ForEach(2..<100) {
                            //Creates view of people from 2->99
                            Text("\($0)")
                            //Our default value was 2 which means it selects the second value in the picker list (2+2 =4)
                        }
                    }
                    
                    .pickerStyle(.navigationLink) //Changes picker menu to another page with menu
                    //*Need a navigation stack on the form to be able to switch to the new menu
                }
                
                //Tip % section 1 (Segmented control)
                Section("Tip percentage"){
                    Picker("Tip percentage", selection: $tipPercentage) {
                        //Ticker for tip percentage with the selection value bound to tip%
                        ForEach(tipPercentages, id: \.self){
                            //For each value in the tip%s array, set the ID to the value of the int itself & print out the value
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented) //Changes the style of the picker
                }
                
                //Tip % section 2 (1-100%)
                Section("Tip percentage 2"){
                    Picker("Choose tip percentage", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink) //makes picker a new screen
                }
                
                //Total check amount
                Section("Total check amount (inc tip)") {
                    Text(totalCheckAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                //Total section
                Section("Total amount per person") {
                    Text(amountPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar { //Lets us add toolbar items for a view
                if amountIsFocused { //If the amount is focused/active, show a done button on a new screen.
                    Button("Done") {
                        amountIsFocused = false //When done button is pressed, make the amount text box not focused/active anymore
                    }
                }
            }
        }
    }
}


#Preview {
    ContentView()
}

//Option+Command+P to refresh canvas
//Command+R to run simulator
//Command+A then Control+I for auto format
