//
//  AccountList.swift
//  iOS_mid
//
//  Created by Jing Han on 2023/5/11.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth
import FirebaseStorage
import PhotosUI

func uploadPhoto(image: UIImage, completion: @escaping (Result<URL, Error>) -> Void) {
        
        let fileReference = Storage.storage().reference().child(UUID().uuidString + ".jpg")
        if let data = image.jpegData(compressionQuality: 0.9) {
            
            fileReference.putData(data, metadata: nil) { result in
                switch result {
                case .success:
                     fileReference.downloadURL(completion: completion)
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
}

func updateMyheadshot(url: String){
    let db = Firestore.firestore()
    let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
    changeRequest?.photoURL = URL(string: url)
    if let user = Auth.auth().currentUser {
        let documentReference =
            db.collection("Account").document(user.email ?? "")
            documentReference.getDocument { document, error in
                guard let document,
                      document.exists,
                      var acc = try? document.data(as: Account.self)
                else {
                    return
                }
                acc.headshot = url
                do {
                            try documentReference.setData(from: acc)
                        } catch {
                            print(error)
                        }
                        
            }
    }
}

struct AccountList: View {
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedPhotoData: UIImage?
    @FirestoreQuery(collectionPath: "Account") var accounts: [Account]
    private var color_ = Color(cgColor: .init(red: 0.6, green: 0.1, blue: 0.1, alpha: 0.1))
    var body: some View {
        NavigationView {
            VStack {
                Text("實驗室成員")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                Color(.orange)
                    .frame(width:350, height: 15)
                    .padding()
                PhotosPicker(selection: $selectedItem){ Label("更新我的大頭照", systemImage: "photo") }
                    .tint(.purple)
                    .controlSize(.large)
                    .buttonStyle(.borderedProminent)
                    .onChange(of: selectedItem) { newItem in
                        Task {
                            if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                selectedPhotoData = UIImage(data:data)
                                uploadPhoto(image: selectedPhotoData!) { result in
                                    switch result {
                                    case .success(let url):
//                                        print(type(of: url))
                                        // update my headshot
                                        updateMyheadshot(url: url.absoluteString)
                                    case .failure(let error):
                                        print(error)
                                    }
                                }
                            }
                        }
                    }
                List {
                    ForEach(accounts) { account in
                        NavigationLink {
                            AccountInfo(account: account)
                        } label: {
                            AccountRow(account: account)
                        }
                    }
                }.listStyle(.sidebar)
            }.background(color_)
        }.navigationTitle("電影列表")
    }
}

struct AccountList_Previews: PreviewProvider {
    static var previews: some View {
        AccountList()
    }
}
