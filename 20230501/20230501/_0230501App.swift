//
//  _0230501App.swift
//  20230501
//
//  Created by Jing Han on 2023/5/1.
//

import SwiftUI
import Firebase

@main
struct _0230501App: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
