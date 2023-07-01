//
//  ContentView.swift
//  BMI_calculator
//
//  Created by Jing Han on 2023/3/7.
//
import SwiftUI

struct ContentView: View {
    
    @State private var weight = ""
    @State private var height = ""
    @State private var bmi = ""
    @State private var gender = 0
    @State private var weigth_status = ""
   
    var body: some View {
        VStack {
            Image(systemName: "figure.walk")
                .font(.largeTitle)
            
            Text("BMI Calculator")
                .font(.title)
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
            
            TextField("Enter your weight (kg)", text: $weight)
                .keyboardType(.decimalPad)
                .padding()
                .border(Color.black, width: 5)
                .padding(EdgeInsets(top: 20, leading: 50, bottom: 0, trailing: 50))
                
            
            TextField("Enter your height (cm)", text: $height)
                .keyboardType(.decimalPad)
                .padding()
                .border(Color.black, width: 5)
                .padding(EdgeInsets(top: 0, leading: 50, bottom: 20, trailing: 50))
            
            
            HStack {
                Text("Gender:")
                    .font(.headline)
                Picker("your gender", selection: $gender){
                    Text("Male").tag(0)
                    Text("Female").tag(1)
                }
                .pickerStyle(.segmented)
                
            }
            .padding(EdgeInsets(top: 0, leading: 50, bottom: 50, trailing: 50))
                        
            Button(action: {
                calculateBMI()
            }, label: {
                Text("Calculate BMI")
            })
                .fontWeight(.bold)
                .font(.headline)
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(40)
                .foregroundColor(.white)
                .padding(5)
                .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.blue, lineWidth: 5)
                )
                
            Text("Your BMI is: \(bmi)")
                .font(.headline)
                .padding()
            
            Text("Weight Status: \(weigth_status)")
                .font(.headline)
                .padding()
            
        }
    }
    
    func calculateBMI() { // calculate BMI value
        if let weight = Double(weight), let height = Double(height) {
            let bmiValue = weight / ((height/100) * (height/100))
            bmi = String(format: "%.2f", bmiValue)
            checkstatus();
        }
        else {
            bmi = "Please check your input!"
            weigth_status = "  :("
        }
    }
    
    func checkstatus() { // check the weigth status
        guard let bmiValue = Double(bmi) else { return }
        if bmiValue < 18.5 {
            weigth_status = "Underweight"
        } else if bmiValue < 24.9 {
            weigth_status = "Healthy weight"
        } else if bmiValue < 30 {
            if gender == 1 {
                weigth_status = "it's a secret"
            } else { weigth_status = "Overweight" }
        } else {
            if gender == 1 {
                weigth_status = "it's a secret"
            } else { weigth_status = "Obesity" }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

