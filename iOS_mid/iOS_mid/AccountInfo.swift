//
//  AccountInfo.swift
//  iOS_mid
//
//  Created by Jing Han on 2023/5/11.
//

import SwiftUI

struct AccountInfo: View {
    let account: Account
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: account.headshot)) { image in
                        image
                           .resizable()
                    } placeholder: {
                        Color.gray
                    }
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
            Text(account.position)
                .font(.system(size:55))
                .bold()
                .padding(5)
            Text(account.name)
                .font(.system(size:50))
                .bold()
                .padding(5)
            
            
            Text(account.phone)
                .font(.title)
                .padding(5)
            Text(account.email)
                .font(.title)
                .padding(5)
        }
        .frame(width: 300, height: 550)
        .navigationTitle("實驗室成員資料")
        
    }
}

struct AccountInfo_Previews: PreviewProvider {
    static var previews: some View {
        AccountInfo(account: .demo)
    }
}
