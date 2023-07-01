//
//  HomeView.swift
//  iOS_mid
//
//  Created by Jing Han on 2023/5/11.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView{
            CheckInView()
                .tabItem{
                    Label("打卡系統", systemImage: "clock.badge.exclamationmark")
                }
            AccountList()
                .tabItem {
                    Label("實驗室成員", systemImage: "person.3")
                }
            ChatContentView()
                .tabItem {
                    Label("聊天室", systemImage: "text.bubble")
                }
            DiaryView()
                .tabItem {
                    Label("研究紀錄", systemImage: "doc.fill")
                    
                }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
