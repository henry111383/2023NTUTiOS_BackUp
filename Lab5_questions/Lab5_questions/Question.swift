//
//  Question.swift
//  Lab5_questions
//
//  Created by Jing Han on 2023/4/17.
//

import Foundation
struct Question : Identifiable {
    let id = UUID()
    let qestion: String
    let choice: [String]
    let answer: String
}

extension Question {
    static let demoQuestion = Question(qestion: "＜關雎＞篇中，君子好「？」", choice: ["求","酋","逑","俅"], answer: "逑")
}
