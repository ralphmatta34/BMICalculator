//
//  ContentView.swift
//  BMICalculator
//
//  Created by David Cormell on 23/02/2022.
//

import SwiftUI

struct ContentView: View {
    
    let bmiCalculator = BMICalculations()
    
    @State var height: String = String()
    @State var weight: String = String()
    @State var bmi: Double = Double()
    @State var classification: String = String()
    
    var body: some View {
        VStack {
            Image("PublicHealth")
            List {
                Section {
                    TextField("Height (cm)", text: $height)
                    TextField("Weight (kg)", text: $weight)
                }
                Section {
                    Button("Calculate BMI", action: {
                        if isValidDouble(weight) && isValidDouble(height) {
                            bmi = bmiCalculator.calculateBmi(weight: getDoubleFromString(x: weight), height: getDoubleFromString(x: height))
                            classification = bmiCalculator.lookUpBmiClassification(bmi: bmi)
                        }
                    })
                }
                Section {
                    if bmi != Double() {
                        if classification == String() {
                            Text("Your BMI is: \(bmi) kg/m^2")
                        } else {
                            Text("""
                                Your BMI is: \(bmi) kg/m^2
                                You are \(classification)
                                """)
                        }
                    }
                }
            }
            
            if !isValidDouble(height) {
                Text("Please enter a valid height")
            }
            if !isValidDouble(weight) {
                Text("Please enter a valid weight")
            }
        }
    }
    
    func isValidDouble(_ x: String) -> Bool {
        if Double(x) != nil {
            return true
        }
        return false
    }
    func getDoubleFromString(x: String) -> Double {
        if let doub = Double(x) {
            return doub
        }
        return -1.0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
