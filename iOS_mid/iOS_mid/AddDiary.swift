//
//  AddDiary.swift
//  iOS_mid
//
//  Created by Jing Han on 2023/5/11.
//

import SwiftUI
import FirebaseFirestoreSwift
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore

struct AddDiaryView: View {
    @Environment(\.presentationMode) var presentationMode
//    @EnvironmentObject var myDiary: DiaryStore
    @State private var tempfeeling = "sun.max.fill"
    @State private var tempTime = Date()
    @State private var tempTitle = ""
    @State private var tempContent = ""
    var emailID : String?
        
    
    func CreateDiary(){
        let db = Firestore.firestore()
        let new_diary = Diary(feeling: tempfeeling, date: tempTime, title: tempTitle, content: tempContent)
        if let user = Auth.auth().currentUser {
            print(user.email)
        }
            do {
                let documentReference = try db.collection("Diary").addDocument(from: new_diary)
            } catch {
                print(error)
            }
            presentationMode.wrappedValue.dismiss()
    }
    
    
    
    var body: some View {
        ZStack{
            Image("addDiary")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .ignoresSafeArea()
                .opacity(0.3)
            VStack {
                Text("Write Down Your Diary!")
                    .font(.title)
                DatePicker("Date :", selection: $tempTime, displayedComponents: .date)
                    .frame(width: 300,alignment: .leading)
                    .padding(10)
                HStack {
                    Text("Title :")
                    TextField("Main idea", text: $tempTitle)
                        .autocapitalization(.words)
                }.frame(width: 300, alignment: .center)
                HStack {
                    Text("feeling :")
                    Picker(selection: $tempfeeling){
                        Image(systemName: "sun.max.fill").tag("sun.max.fill")
                        Image(systemName: "cloud.fill").tag("cloud.fill")
                        Image(systemName: "cloud.rain.fill").tag("cloud.rain.fill")
                    } label: {
                        Text("feeling")
                    }
                }.frame(width: 300, alignment: .leading)
                VStack {
                    Text("Content :")
                    TextEditor(text: $tempContent)
                                .frame(height: 400)
                                .border(.black, width: 2)
                                .padding(10)
                                .padding(10)
                                .cornerRadius(10)
                }.frame(width: 350, alignment: .leading)
                
                
                Button("Done") {
                    if !tempTitle.isEmpty {
                        CreateDiary()
//                        myDiary.Diary.append(
//                            Diary(feeling: tempfeeling, date: tempTime, title: tempTitle, content: tempContent)
//                        )
                    }
//                    presentationMode.wrappedValue.dismiss()
                }
                Spacer()
            }
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        
    }
}

struct AddDiary_Previews: PreviewProvider {
    static var previews: some View {
        AddDiaryView()
    }
}
