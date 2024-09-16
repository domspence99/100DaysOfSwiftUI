//
//  ContentView.swift
//  Conversions
//
//  Created by Dominic Spence on 06/09/2024.
//
//  Create a unit conversion app
//  I.e. km-> miles->feet etc

import SwiftUI

struct ContentView: View {
    @State private var inputLength = 0.0 //State var for inputLength
    
    @FocusState private var inputLengthisFocused : Bool //Bool for if input text field is active
    
    let units = ["m","km","ft","yd","mi"]
    
    @State private var inputUnitSelection = "km" //State var for inputUnit
    @State private var outputUnitSelection = "km" //State var for outputUnit
    
    //Computed property for user input length in m
    var inputLengthInMeters: Double {
        //Switch to change users input length into meters
        switch inputUnitSelection{
        case "m":
            return inputLength
        case "km":
            return inputLength * 1000
        case "ft":
            return inputLength / 3.281
        case "yd":
            return inputLength / 1.094
        case "mi":
            return inputLength * 1609
        default:
            return inputLength
            
        }
    }
    
    //Computed property to change users input length (in meters) to desired output length
    var outputLength: Double {
        switch outputUnitSelection{
        case "m":
            return inputLengthInMeters
        case "km":
            return inputLengthInMeters / 1000
        case "ft":
            return inputLengthInMeters * 3.281
        case "yd":
            return inputLengthInMeters * 1.094
        case "mi":
            return inputLengthInMeters / 1609
        default:
            return inputLengthInMeters
        }
    }
    
    var body: some View {
        //Navigation stack (like vstack, allows for an overlapping stack of views, menus, forms etc etc)
        //Can add views over the top of previous views, like moving through a stack of views)
        NavigationStack{
            //Form created for the different sections of the app
            Form {
                //Section for user input
                Section("Input length"){
                    //Value of user input is double bound to the input length var (reads,writes & updates view automatically)
                    TextField("Enter input length", value: $inputLength, format: .number)
                        .keyboardType(.decimalPad) //Forces decimal keyboard
                        .focused($inputLengthisFocused) //Binds the focused bool to text field
                    
                    //Picker for unput unit is double bound to input unit selection
                    Picker("Input unit", selection: $inputUnitSelection){
                        //Loops through every element in unit array, & shows text view for each
                        ForEach(units, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented) //Shows elements of picker as a segmented style
                    
                    //Temporary input conversion view -> m
                    //Text("\(inputLengthInMeters)")
                }
                //Section for output unit & result
                Section("Output length"){
                    //Same picker as input unit but bound to the output selection
                    Picker("Select output unit", selection: $outputUnitSelection) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Text("\(outputLength.formatted())")
                        
                }
            }
            .navigationTitle("Unit Converter") //Adds title to form & creates a safe space at top for scrolling
            //In the toolbar section, if the input length is active, show a done button & unfocus the text field if it is pressed (i.e. clear the keyboard)
            .toolbar {
                if inputLengthisFocused {
                    Button("Done") {
                        inputLengthisFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
