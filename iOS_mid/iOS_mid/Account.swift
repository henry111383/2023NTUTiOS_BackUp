//
//  Account.swift
//  iOS_mid
//
//  Created by Jing Han on 2023/5/10.
//

import Foundation
import FirebaseFirestoreSwift

struct Account: Codable, Identifiable {
    @DocumentID var id: String?
    let password: String
    let name: String
    let email: String
    let position: String
    let phone: String
    var headshot: String
}

extension Account {
    static let demo = Account(password: "Lab1621", name: "Peter", email: "Peter@test.com", position: "教授", phone: "0987654321", headshot: "https://upload.wikimedia.org/wikipedia/zh/4/4e/Your_name_poster.jpg")
}
