//
//  BMICalculations.swift
//  BMICalculator
//
//  Created by Cormell, David - DPC on 24/02/2022.
//

import Foundation



class BMICalculations {
    func calculateBmi(weight: Double, height: Double) -> Double {
        var bmi = weight/pow(height*0.01, 2)
        bmi = bmi.rounded(toPlaces: 1)
        
        return bmi
    }
    
    func lookUpBmiClassification(bmi: Double) -> String {
        var classification: String = String()
        
        if bmi < 18.5 {
            classification = "Underweight"
        } else if bmi >= 18.5 && bmi <= 24.9 {
            classification = "Healthy"
        } else if bmi >= 25.0 && bmi <= 29.9 {
            classification = "Overweight"
        } else if bmi >= 30.0 {
            classification = "Obese"
        }
        
        return classification
    }
}
