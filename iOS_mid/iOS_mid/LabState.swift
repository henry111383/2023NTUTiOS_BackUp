//
//  LabState.swift
//  iOS_mid
//
//  Created by Jing Han on 2023/5/11.
//

import Foundation
import FirebaseFirestoreSwift

struct LabState: Codable, Identifiable {
    @DocumentID var id: String?
    var state : String
}

extension LabState {
    static let demo = LabState(state: "關門中")
}
