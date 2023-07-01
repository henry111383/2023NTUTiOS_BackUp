//
//  CS0519App.swift
//  CS0519
//
//  Created by Jing Han on 2023/5/19.
//

import SwiftUI

@main
struct CS0519App: App {
    var body: some Scene {
        DocumentGroup(newDocument: CS0519Document()) { file in
            ContentView(document: file.$document)
        }
    }
}
