//
//  Account.swift
//  20230501
//
//  Created by Jing Han on 2023/5/10.
//

//import Foundation
import FirebaseFirestoreSwift

struct Account: Codable, Identifiable {
    @DocumentID var id: String?
    let account_id: String
    let password: String
    let name: String
    let email: String
    let position: String
    let phone: String
}
