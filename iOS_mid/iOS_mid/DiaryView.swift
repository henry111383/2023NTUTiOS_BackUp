//
//  DiaryView.swift
//  iOS_mid
//
//  Created by Jing Han on 2023/5/11.
//

import SwiftUI
import FirebaseFirestoreSwift
import FirebaseAuth
import FirebaseFirestore

struct DiaryView: View {
    @State private var showAddDiary = false
//    @EnvironmentObject private var myDiary: DiaryStore
    @FirestoreQuery(collectionPath: "Diary") var diarys: [Diary]
    
    var body: some View {
        NavigationView {
            ZStack{
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .ignoresSafeArea()
                    .opacity(0.3)
                VStack(spacing: 20) {
                    if diarys.isEmpty {
                        Text("Record your Diary here!")
                            .padding(10)
                            .background()
                            .foregroundColor(.blue)
                            .cornerRadius(20)
                            .padding(20)
                    }
                    Text("").padding(5)
                    ForEach(diarys) { DiaryCase in
                        NavigationLink {
                            DiaryInfo(Diary: DiaryCase, DiaryID: DiaryCase.id)
                        } label: {
                            DiaryRow(Diary: DiaryCase)
                                .padding([.horizontal],15)
                        }
                    }
                    Spacer()
                }
                .sheet(isPresented: $showAddDiary) {
                    AddDiaryView()
                }
                .navigationTitle("Records")
                .toolbar {
                    ToolbarItem {
                        Button(action: { showAddDiary.toggle() }) {
                            Image(systemName: "plus.circle")
                                .font(.title)
                                .background(Color.white)
                                .cornerRadius(30)
                        }
                    }
                }
            }
        }
    }
}

struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView()
//            .environmentObject(DiaryStore())
    }
}
