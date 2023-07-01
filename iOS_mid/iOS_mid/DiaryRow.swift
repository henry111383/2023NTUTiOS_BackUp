//
//  DiaryRow.swift
//  iOS_mid
//
//  Created by Jing Han on 2023/5/11.
//

import SwiftUI

struct DiaryRow: View {
    let Diary : Diary
    var body: some View {
        HStack {
            Image(systemName: "\(Diary.feeling)")
                .resizable()
                .scaledToFit()
                .clipped()
                .frame(width: 50, height: 50)
                .padding(10)
            VStack(alignment: .leading) {
                Text(Diary.title)
                    .font(.title)
                Text(Diary.date, style: .date)
            }
            Spacer()
        }
        .padding(5)
        .background(Color.white)
        .cornerRadius(20)
        .overlay(
                     RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.blue, lineWidth: 5)
                  )
    }
}


struct DiaryRow_Previews: PreviewProvider {
    static var previews: some View {
        DiaryRow(Diary: .demoDiary)
            .previewLayout(.fixed(width: 300, height: 700))
    }
}
