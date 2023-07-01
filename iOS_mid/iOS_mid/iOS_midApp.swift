//
//  iOS_midApp.swift
//  iOS_mid
//
//  Created by Jing Han on 2023/5/10.
//

import SwiftUI
import Firebase

@main
struct iOS_midApp: App {
    
    init() {
            FirebaseApp.configure()
        }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
