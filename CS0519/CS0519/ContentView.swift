//
//  ContentView.swift
//  CS0519
//
//  Created by Jing Han on 2023/5/19.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: CS0519Document

    var body: some View {
        TextEditor(text: $document.text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(CS0519Document()))
    }
}
