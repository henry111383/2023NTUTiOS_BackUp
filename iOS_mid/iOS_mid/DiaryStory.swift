//
//  DiaryStory.swift
//  iOS_mid
//
//  Created by Jing Han on 2023/5/11.
//

import Foundation

import SwiftUI
import FirebaseFirestoreSwift

//class DiaryStore: ObservableObject {
//    @Published var Diary: [Diary] = []
//}

struct Diary:  Codable, Identifiable {
    @DocumentID var id: String?
    let feeling: String
    let date : Date
    let title: String
    var content: String
}

extension Diary {
    static let demoDiary = Diary(feeling: "cloud.rain.fill", date: Date(), title: "HappyBirthday", content: "Today is my Birthday!!!\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1")
}
