//
//  ContentView.swift
//  CS0519_2
//
//  Created by Jing Han on 2023/5/19.
//

import SwiftUI

struct ContentView: View {
    
    enum Day {
        case Monday
        case Tuesday
        case Wednesday
        case Thursday
        case Friday
        case Saturday
        case Sunday
        
        func checkType() -> String{
            switch self{
            case .Monday, .Tuesday, .Wednesday, .Thursday, .Friday :
                return "Weekday"
            case .Saturday, .Sunday:
                return "weekend"

            }
        }
    }

    func dayType(for day: Day) -> String{
        switch day{
        case .Monday, .Tuesday, .Wednesday, .Thursday, .Friday :
            return "Weekday"
        case .Saturday, .Sunday:
            return "weekend"

        }
        
    }
    let day1 = Day.Friday
    let day2 = Day.Saturday
    
    var body: some View {
        VStack {
            Text(dayType(for: day1))
            Text(dayType(for: day2))
            Text(day1.checkType())
            Text(day2.checkType())
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
