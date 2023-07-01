//
//  ContentView.swift
//  Lab5_questions
//
//  Created by Jing Han on 2023/4/17.
//

import SwiftUI

var question = [
    Question(qestion: "下列何者非「初唐四傑」？", choice: ["王維", "楊炯", "盧照鄰", "駱賓王"], answer: "王維"),
    Question(qestion: "《詩經》中句法多以什麼為主？", choice: ["四言", "五言", "七言", "九言"], answer: "四言"),
    Question(qestion: "<關雎>篇中，君子好「?」", choice: ["求", "酋", "逑", "俅"], answer: "逑"),
    Question(qestion: "下列何者不是《詩經》內容？", choice: ["風", "雅", "頌", "賦"], answer: "賦"),
    Question(qestion: "《詩經》發源於？", choice: ["長江流域一帶", "黃河流域一帶", "岷江一帶", "松花江一帶"], answer: "黃河流域一帶")
    ]

struct QuestionView: View {
    let question : [Question]
    @State var questionNumber : Int
    @Binding var isDone : Bool
    @Binding var score : Int
    @State private var IsAnswered = false
    @State private var showAlert = false
    @State private var alertTitle = ""
    var body: some View {
        ZStack{
            Image("APP_background")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .ignoresSafeArea()
            VStack{
                Text("Q\(questionNumber+1), Score : \(score)")
                    .padding()
                    .font(.title)
                    .foregroundColor(.red)
                    .frame(width: 300, height: 50)
                    .background(.green)
                    .cornerRadius(20)
                    .padding(5)
                    
                HStack{
                    Image("problem")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 130, height: 130)
                    Text(question[questionNumber].qestion)
                        .font(.title2)
                        .foregroundColor(.black)
                        .frame(width: 200, height: 200)
                        .padding(5)
                        .background(.yellow)
                        .cornerRadius(30)
                    Spacer()
                }
                    .frame(width: 350, height: 200)
                VStack{
                    ForEach(0..<4){ index in
                        let choiceAns =  question[questionNumber].choice[index]
                        let trueAns = question[questionNumber].answer
                        Button{
                            showAlert = true
                            IsAnswered = true
                            if choiceAns == trueAns {
                                alertTitle = "答對!"
                                score = score + 20
                            }else{
                                alertTitle = "答錯!應該是 \(trueAns)"
                            }
                        } label: {
                            AnswerRow(question: question[questionNumber], index: index)
                                .frame(width: 300, height: 100)
                        }
                        .alert(alertTitle, isPresented: $showAlert, actions: {
                            Button("OK") {
                                if questionNumber == 4 {
                                    isDone.toggle()
                                }else{
                                    questionNumber = questionNumber+1
                                }
                            }
                        })
                    }
                }
            }
        }
    }
}

struct FinalView: View{
    @Binding var score : Int
    var body: some View {
        ZStack{
            Image("APP_background")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .ignoresSafeArea()
            Text("Your score:\(score)")
                .font(.title)
                .foregroundColor(.red)
                .frame(width: 300, height: 300)
                .background(.green)
                .cornerRadius(20)
        }
    }
}

struct ContentView: View {
    @State private var score = 0
    @State var userAns : String = ""
    @State var questionNumber : Int = 0
    @State var isDone : Bool = false
    var body: some View {
        if !isDone{
            QuestionView(question: question, questionNumber: questionNumber, isDone: $isDone, score: $score)
        }else{
            FinalView(score: $score)
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
