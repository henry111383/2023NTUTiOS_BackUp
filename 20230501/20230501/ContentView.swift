//
//  ContentView.swift
//  20230501
//
//  Created by Jing Han on 2023/5/1.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct ContentView: View {
//    load the data from firestore
//    @FirestoreQuery(collectionPath: "Account") var accounts: [Account]
    
    
    var body: some View {
        Button("Create"){
            print("OK")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
