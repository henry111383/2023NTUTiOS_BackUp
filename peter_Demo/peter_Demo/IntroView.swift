//
//  IntroView.swift
//  peter_Demo
//
//  Created by Jing Han on 2023/4/10.
//

import SwiftUI

struct IntroView: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }.navigationTitle("spider man")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            IntroView()
        }
    }
}
