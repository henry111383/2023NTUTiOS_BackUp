//
//  SongList.swift
//  peter_Demo
//
//  Created by Jing Han on 2023/4/10.
//

import SwiftUI

struct SongList: View {
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
                Section {
                    ForEach(sunnyDaySongs) { song in
                        SongRow(song: song)
                    }
                } header: {
                    Text("晴天情歌")
                }
                Section {
                    ForEach(rainyDaySongs) { song in
                        SongRow(song: song)
                    }
                } header: {
                    Text("雨天情歌")
                }
            }
            .navigationTitle("情歌王")
        }
    }
//    let songs = [
//        Song(name: "對的時間點", singer: "林俊傑", lyrics: "如果 愛情是場 遠程的渦旋 僅管 繞著圈子 也要走向前 不離心太遠 我要面朝最藍的晴天 不脫離軌道有你在身邊"),
//        Song(name: "說好不哭", singer: "周杰倫", lyrics: "沒有了聯絡 後來的生活 我都是聽別人說 說妳怎麼了 說妳怎麼過 放不下的人是我 人多的時候 就待在角落 就怕別人問起我 你們怎麼了 妳低著頭 護著我連抱怨都沒有")
//    ]
//
//
//    var body: some View {
//        NavigationView {
//            List {
//                //            Text("iPhone 13 Pro Max")
//                //            Text("iPhone 13 Pro")
//                //            Text("iPhone 13")
//                //            SongRow(song: Song(name: "對的時間點", singer: "林俊傑"))
//                //            SongRow(song: Song(name: "說好不哭", singer: "周杰倫"))
//                ForEach(songs) { song in
//                    NavigationLink {
//                        SongDetail(song: song)
//                    } label: {
//                        SongRow(song: song)
//                    }
//                }
//            }
//            .navigationTitle("情歌王")
//        }
//    }
}

struct SongList_Previews: PreviewProvider {
    static var previews: some View {
        SongList()
    }
}
