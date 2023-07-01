//
//  DiaryInfo.swift
//  iOS_mid
//
//  Created by Jing Han on 2023/5/11.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct DiaryInfo: View {
    let DDiary: Diary
    let DiaryID: String?
    @State private var tempContent: String
    
    init(Diary: Diary, DiaryID: String?) {
            self.DDiary = Diary
            self.DiaryID = DiaryID
            _tempContent = State(initialValue: Diary.content)
    }
    
    func saveDiary(){
        let db = Firestore.firestore()
        let documentReference =
            db.collection("Diary").document(DiaryID!)
            documentReference.getDocument { document, error in
                guard let document,
                      document.exists,
                      var tempDiary = try? document.data(as: Diary.self)
                else {
                    return
                }
                tempDiary.content = tempContent
                do {
                    try documentReference.setData(from: tempDiary)
                } catch {
                    print(error)
                }
            }
        print("OK")
    }
    
    
    var body: some View {
        NavigationView{
            ZStack {
                Image("diary")
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .ignoresSafeArea()
                    .opacity(0.3)
                
                VStack {
                    Image(systemName: "\(DDiary.feeling)")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(Color.black)
                        .padding([.vertical],10)
                        
                    HStack {
                        Text("Date :")
                            .font(.title)
                            .foregroundColor(Color.white)
                        Text((DDiary.date), style: .date)
                            .font(.title)
                            .foregroundColor(Color.white)
                    }
                    .frame(width: 300)
                    .padding(10)
                    .background(Color.gray)
                    .cornerRadius(20)
                    .foregroundColor(Color.blue)
                    VStack{
                        TextEditor(text: $tempContent)
                            .frame(height: 350)
                            .padding()
                    }
                    .frame(width: 300, height: 350)
                    .background(Color.white)
                    .cornerRadius(20)
                    .padding([.bottom], 30)
                    HStack{
                        Spacer()
                        Button("儲存內容") {
                            saveDiary()
                        }
                        .padding([.trailing], 40)
                        .bold()
                    }
                    Spacer()
                }
            }
        }.navigationTitle(DDiary.title)
    }
}





struct DiaryInfo_Previews: PreviewProvider {
    static var previews: some View {
        DiaryInfo(Diary: .demoDiary, DiaryID: "qR0Cmku8wwZYhdSehwef")
    }
}



