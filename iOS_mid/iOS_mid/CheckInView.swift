//
//  CheckInView.swift
//  iOS_mid
//
//  Created by Jing Han on 2023/5/11.
//

import SwiftUI
import FirebaseFirestoreSwift
import FirebaseAuth
import FirebaseFirestore

struct CheckInView: View {
    @State private var tempText = ""
    let db = Firestore.firestore()
    @State private var stateColor = Color.blue
    
    func fetch() {
        db.collection("LabState").document("DoorState").getDocument { document, error in
            guard let document,
                  document.exists,
                  let labstate = try? document.data(as: LabState.self) else {
                        return
                    }
            self.tempText = labstate.state
        }
    }
    
    func update(){
        db.collection("LabState")
            .addSnapshotListener { Snapshot, error in
                guard let Snapshot else { return }
                Snapshot.documentChanges.forEach { documentChange in
                    guard let labstate = try? documentChange.document.data(as: LabState.self) else { return }
                    self.tempText = labstate.state
                    if (labstate.state == "開放中") { self.stateColor = Color.blue }
                    if (labstate.state == "關閉中") { self.stateColor = Color.red }
                }
            }
    }
    
    func CheckIn(str:String) {
        print(str)
        let documentReference =
            db.collection("LabState").document("DoorState")
            documentReference.getDocument { document, error in
                guard let document,
                      document.exists,
                      var acc = try? document.data(as: LabState.self)
                else {
                    return
                }
                acc.state = str
                do {
                            try documentReference.setData(from: acc)
                        } catch {
                            print(error)
                        }
                        
            }

    }
    
    
    var body: some View {
        VStack{
            ClockView()
                .frame(height: 350)
            HStack{
                Text("實驗室狀況 : ")
                    .font(.title)
                    .bold()
                Text(tempText)
                    .font(.title)
                    .bold()
                    .foregroundColor(self.stateColor)
                    .onAppear { // 監聽文件的變更
                        fetch()
                        update()
                    }
            }
            .padding(20)
            HStack{
                Button("開門上班"){
                    CheckIn(str: "開放中")
                }
                .padding(5)
                .padding([.horizontal], 10)
                .font(.system(size:20))
                .bold()
                .background(Color(cgColor: .init(red: 0, green: 0, blue: 0, alpha: 0.1)))
                .cornerRadius(20)
                .overlay(
                             RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.black, lineWidth: 5)
                         )
                .padding([.trailing], 20)
                Button("關門下班"){
                    CheckIn(str: "關閉中")
                }
                .padding(5)
                .padding([.horizontal], 10)
                .font(.system(size:20))
                .bold()
                .background(Color(cgColor: .init(red: 0, green: 0, blue: 0, alpha: 0.1)))
                .cornerRadius(20)
                .overlay(
                             RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.black, lineWidth: 5)
                         )
            }
        }
    }
}

struct CheckInView_Previews: PreviewProvider {
    static var previews: some View {
        CheckInView()
    }
}
