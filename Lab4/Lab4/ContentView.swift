//
//  ContentView.swift
//  Lab4
//
//  Created by Jing Han on 2023/4/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        TabView {
            MovieList()
                .tabItem {
                    Label("電影列表", systemImage: "music.house.fill")
                }
            DirectorDetail()
                .tabItem {
                    Label("製作團隊", systemImage: "person")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
