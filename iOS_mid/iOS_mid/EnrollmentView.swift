//
//  EnrollmentView.swift
//  iOS_mid
//
//  Created by Jing Han on 2023/5/10.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

struct EnrollmentView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showAlert = false
    @State private var email = ""
    @State private var password = ""
    @State private var name = ""
    @State private var position = ""
    @State private var phone = ""
    let pos = ["大專生", "碩士生", "博士生", "助理", "教授"]
    @State var error_message = ""
    @State var CreateSccess = false
    private var color_gray = Color(cgColor: .init(red: 0, green: 0, blue: 0, alpha: 0.1))
    
    func CheckInfo_Create() -> Bool {
        if email.isEmpty || password.isEmpty || name.isEmpty || position.isEmpty || phone.isEmpty {
            return false
        } else {
            return true
        }
    }
    
    func CreateAccount(){
        let db = Firestore.firestore()
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    
             guard let _ = result?.user,
                   error == nil else {
                 error_message = error?.localizedDescription ?? ""
                 showAlert = true
                 return
             }
             // 成功
            error_message = "Account is Sccessfully Created!!"
            CreateSccess = true
            let new_account = Account(password: password, name: name, email: email, position: position, phone: phone, headshot: "")
                do {
                    let documentReference = try db.collection("Account").document(email)
                    documentReference.setData([
                        "email":email,
                        "name":name,
                        "password":password,
                        "position":position,
                        "phone":phone,
                        "headshot":""])
                    print(documentReference.documentID)
                } catch {
                    print(error)
                }
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    var body: some View {
        VStack{
            VStack {
                Image(systemName: "person")
                    .font(.system(size:80))
                    .padding()
                Text("建立你的帳戶")
                    .font(.largeTitle)
                    .bold()
                VStack{}.frame(width: 350, height: 10)
                HStack { // Email
                    Text("輸入信箱：")
                        .padding()
                    TextField("Email", text: $email, prompt: Text("Input your email"))
                        .padding()
                        .autocapitalization(.none) // 禁用自動首字母大寫
                        .background(color_gray)
                        .cornerRadius(20)
                        .overlay(
                                     RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.black, lineWidth: 5)
                                 )
                }
                    .padding([.horizontal], 20)
                HStack { // Password
                    Text("設定密碼：")
                        .padding()
                        
                    SecureField("Email", text: $password, prompt: Text("Set your password"))
                        .padding()
                        .background(color_gray)
                        .cornerRadius(20)
                        .overlay(
                                     RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.black, lineWidth: 5)
                                 )
                }
                    .padding([.horizontal], 20)
                HStack {
                    // Name
                    Text("你的姓名：")
                        .padding()
                    TextField("Email", text: $name, prompt: Text("Your name"))
                        .padding()
                        .background(color_gray)
                        .cornerRadius(20)
                        .overlay(
                                     RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.black, lineWidth: 5)
                                 )
                }
                    .padding([.horizontal], 20)
                HStack{
                    // Position
                    Text("年級／職位：")
                        .padding()
                    Picker(selection: $position){
                        Text("選擇你的職位")
                        ForEach(pos, id: \.self) { posName in
                            Text(posName)
                        }
                    } label: {
                        Text("選擇你的職位")
                    }
                    Spacer()
                }
                    .padding([.horizontal], 20)
                HStack {
                    // PhoneNumber
                    Text("你的電話：")
                        .padding()
                    TextField("phone", text: $phone, prompt: Text("Your phone number"))
                        .padding()
                        .background(color_gray)
                        .cornerRadius(20)
                        .overlay(
                                     RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.black, lineWidth: 5)
                                 )
                }
                    .padding([.horizontal], 20)
            }
                .frame(width: 350)
                .padding(20)
            
            // 檢查有無問題
            Button("建立帳號"){
                if(CheckInfo_Create()){
                    // 嘗試建立～
                    CreateAccount()
                }else{
                    error_message = "請確認你的輸入"
                    showAlert = true
                }
            }
            .onChange(of: error_message) { value in
                showAlert = true
            } // 等error_message才發出警告
            .alert(error_message, isPresented: $showAlert, actions: {
                Button("OK"){
                    if(CreateSccess){
                        print("Exit")
                    }
                }})
            Spacer()
        }
    }
}


struct EnrollmentView_Previews: PreviewProvider {
    static var previews: some View {
        EnrollmentView()
    }
}
