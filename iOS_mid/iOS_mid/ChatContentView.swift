//
//  ChatContentView.swift
//  iOS_mid
//
//  Created by Jing Han on 2023/5/15.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Message: Codable, Identifiable {
    @DocumentID var id: String?
    let sender: String
    let body: String
    let date : Date
}

class ChatViewModel: ObservableObject {
    @Published var messages: [Message] = []
    
    private let db = Firestore.firestore()
    private let collectionName = "messages"
    
    private var listenerRegistration: ListenerRegistration?
    
    func startListening() {
//        let query = db.collection("messages").order(by: "date")
        listenerRegistration = db.collection(collectionName)
            .order(by: "date")
            .addSnapshotListener { snapshot, error in
                guard let snapshot = snapshot else {
                    print("Error fetching messages: \(error?.localizedDescription ?? "unknown error")")
                    return
                }
                self.messages = snapshot.documents.compactMap { document in
                    guard let message = try? document.data(as: Message.self) else { return nil }
                    return message
                }
            }
    }
    
    func stopListening() {
        listenerRegistration?.remove()
    }
    
    func sendMessage(body: String) {
        let user = Auth.auth().currentUser
        let sender = user?.email ?? ""
        let message = Message(sender: sender, body: body, date: Date())
        do {
            _ = try db.collection(collectionName).addDocument(from:message)
        } catch {
            print("Error adding message: \(error.localizedDescription)")
        }
    }
    
}

struct ChatContentView: View {
    @StateObject private var viewModel = ChatViewModel()
    @State private var sender = ""
    @State private var message = ""
    
    var body: some View {
        VStack {
            Text("ChatRoom")
                .font(.largeTitle)
                .foregroundColor(Color.blue)
                .bold()
            List(viewModel.messages) { message in
                HStack{
                    VStack(alignment: .leading) {
                        Text("\(message.sender):")
                            .font(.footnote)
                            .foregroundColor(.gray)
                        Text("\(message.body)")
                    }
                    Spacer()
                    VStack(alignment: .trailing){
                        Text(message.date, style: .date)
                        Text(message.date, style: .time)
                    }
                    .font(.system(size:10))
                }
                
            }
            .onAppear {
                viewModel.startListening()
            }
            .onDisappear {
                viewModel.stopListening()
            }
            
            Divider()
            
            HStack {
                TextField("Enter a message", text: $message)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button{
                    if (message.isEmpty) {
                        
                    }else{
                        viewModel.sendMessage(body: message)
                        message = ""
                    }
                } label: {
                    Image(systemName: "paperplane.fill")
                }
            }
            .padding()
        }
    }
}

struct ChatContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChatContentView()
    }
}

