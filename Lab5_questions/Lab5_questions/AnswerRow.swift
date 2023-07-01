//
//  AnswerRow.swift
//  Lab5_questions
//
//  Created by Jing Han on 2023/4/17.
//

import SwiftUI

struct AnswerRow: View {
    let question : Question
    let index : Int
    var body: some View {
        VStack {
            HStack {
                Image("user")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 90)
                    .clipShape(Circle())
                    .clipped()
                    .background(.blue)
                    .cornerRadius(100)
                    .padding(5)
                Text(question.choice[index])
                    .foregroundColor(.white)
                    .font(.title)
                    .padding(10)
                Spacer()
            }
            .background(.purple)
            .cornerRadius(20)
            .frame(width: 350, height: 150)
            .shadow(radius: 25)
        }
    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(question: .demoQuestion, index: 2)
            .previewLayout(.fixed(width: 300, height: 700))
    }
}
