//
//  ContentView.swift
//  iOS_mid
//
//  Created by Jing Han on 2023/5/10.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth

struct ContentView: View {
    @State var showflag = true
    var body: some View {
        ZStack{
            if showflag {
                LoggingView(showflag: self.$showflag)
            }
            else {
                HomeView()
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
