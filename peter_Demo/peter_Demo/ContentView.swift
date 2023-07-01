//
//  ContentView.swift
//  peter_Demo
//
//  Created by Jing Han on 2023/3/31.
//

import SwiftUI

struct ContentView: View {
    
    let sunnyDaySongs = [
        Song(name: "晴天", singer: "何維健", lyrics: "要記得晴天 勝得過下雨天 你的笑要被我看見 就這樣笑著笑著 煩惱不見 你就是我的太陽 別在乎別人怎麼想")
    ]
    let rainyDaySongs = [
        Song(name: "下雨天", singer: "南拳媽媽", lyrics: "下雨天 了怎麼辦 我好想你 我不敢打給你 我找不到原因"),
        Song(name: "又下雨了", singer: "李心潔", lyrics: "又下雨 了你最喜歡的天氣 收音機正播放著傷心的歌曲 你在這座城的那裏看雨 是一個人 還是已經有人陪著你")
    ]
    
    var body: some View {
        NavigationView {
            List {
                ScrollView(.horizontal) {
                    HStack(spacing: 20) {
                        ForEach(1..<8) { item in
                            NavigationLink {
                                Text("harry\(item)")
                            } label: {
                                Image("harry\(item)")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 200, height: 200)
                                    .clipped()
                            }
                        }
                    }
                }
                ForEach(rainyDaySongs) { song in
                    NavigationLink {
                        SongDetail(song: song)
                    } label: {
                        SongRow(song: song)
                    }
                }
            }
            .navigationBarTitle("情歌王")
        }
    }
}





//// TabView
//struct ContentView: View {
//    var body: some View {
//        TabView {
//            ForEach(1..<8) { item in
//                Image("harry\(item)")
//                    .resizable()
//                    .scaledToFit()
//            }
//        }
//        .tabViewStyle(.page)
//        .indexViewStyle(.page(backgroundDisplayMode: .always))
//    }
//}


//struct ContentView: View {
//    var body: some View {
//
//        TabView {
//            SongList()
//                .tabItem {
//                    Label("情歌", systemImage: "music.house.fill")
//                }
//            Text("製作中")
//                .tabItem {
//                    Label("製作中", systemImage: "hammer")
//                }
//        }
//    }
//}
//
//struct ContentView: View {
//    var body: some View {
//        NavigationView {
//            VStack {
//                Text("Hi, nice to meet you!")
//                    .foregroundColor(Color(red: 40/255, green: 200/255, blue: 70/255))
//                    .font(.title)
//                    .padding()
//                    .background(.blue)
//                    .cornerRadius(20)
//                NavigationLink {
//                    IntroView()
//                } label: {
//                    Text("YOLO").font(.callout)
//                }
//                    .foregroundColor(.cyan)
//                ZStack(alignment: .bottomTrailing) {
//                    Image("dog")
//                        .resizable()
//                        .scaledToFit()
//                        .clipShape(Circle())
//                    Text("#")
//                        .font(.title)
//                        .frame(width: 40, height: 40)
//                        .background(Color.orange)
//                        .clipShape(Circle())
//                        .offset(x:-100, y:0)
//                }
//            }.navigationTitle("menu")
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
