//
//  AccountRow.swift
//  iOS_mid
//
//  Created by Jing Han on 2023/5/11.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth

struct AccountRow: View {
    let account : Account
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: account.headshot)) { image in
                        image
                           .resizable()
                    } placeholder: {
                        Color.gray
                    }
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
            VStack{}.frame(width: 50)
            VStack(alignment: .leading) {
                Text(account.position).bold()
                Text(account.name)
            }
            Spacer()
        }.border(.black, width: 3)
    }
}

struct AccountRow_Previews: PreviewProvider {
    static var previews: some View {
        AccountRow(account: .demo)
            .previewLayout(.fixed(width: 300, height: 700))
    }
}
