//
//  LoggingView.swift
//  iOS_mid
//
//  Created by Jing Han on 2023/5/11.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

struct LoggingView: View {
    @Binding var showflag:Bool
    public init(showflag: Binding<Bool>) {
        self._showflag = showflag
    }
    @State private var showAlert = false
    @State private var accountID = ""
    @State private var password = ""
    @State var error_message = ""
    @State var LoggingSccess = false
    private var color_gray = Color(cgColor: .init(red: 0, green: 0, blue: 0, alpha: 0.1))
    
    func LoggingAccount(){
//        Auth.auth().signIn(withEmail: "iOS_biolab@test.com", password: "Lab1621") { result, error in
        Auth.auth().signIn(withEmail: accountID, password: password) { result, error in
             guard error == nil else {
                 error_message = error?.localizedDescription ?? ""
                 showAlert = true
                 return
             }
            LoggingSccess = true
            error_message = "Successfully Logging"
            print("success")
            showflag.toggle()
        }
    }
    
    var body: some View {
        NavigationView{
            VStack{
                VStack{}.frame(width: 350, height: 50)
                VStack {
                    Image("Logo")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .padding()
                    Text("歡迎使用LabPal")
                        .font(.system(size:40))
                        .bold()
                        .foregroundColor(Color.blue)
                    Text("請登入你的帳戶")
                        .font(.largeTitle)
                        .bold()
                    VStack{}.frame(width: 350, height: 30)
                    HStack { // AccountID
                        Text("帳號：")
                            .padding()
                        TextField("AccountID", text: $accountID, prompt: Text("Input your AccountID"))
                            .padding()
                            .autocapitalization(.none) // 禁用自動首字母大寫
                            .background(color_gray)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.black, lineWidth: 5)
                            )
                    }
                    .padding([.horizontal ,.bottom], 20)
                    HStack { // Password
                        Text("密碼：")
                            .padding()
                        
                        SecureField("Password", text: $password, prompt: Text("Input your password"))
                            .padding()
                            .background(color_gray)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.black, lineWidth: 5)
                            )
                    }
                    .padding([.horizontal], 20)
                    VStack{}.frame(width: 350, height: 50)
                    HStack{
                        NavigationLink{
                            EnrollmentView()
                        } label: {
                            Text("註冊帳號")
                        }
                        Text(" | ")
                        Button("登入帳號"){
                            LoggingAccount()
                            
                        }
                        .onChange(of: error_message) { value in
                            showAlert = true
                        } // 等error_message才發出警告
                        .alert(error_message, isPresented: $showAlert, actions: {
                            Button("OK"){
                                if(LoggingSccess){
                                    print("Exit")
                                }
                                }})
                    }
                }
            }
        }
    }
}

struct LoggingView_Previews: PreviewProvider {
    static var previews: some View {
        LoggingView(showflag: .constant(true))
    }
}
