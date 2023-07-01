//
//  SongRow.swift
//  peter_Demo
//
//  Created by Jing Han on 2023/4/10.
//

import SwiftUI

struct SongRow: View {
    let song : Song
    var body: some View {
        HStack {
            Image(song.name)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipped()
            VStack(alignment: .leading) {
                Text(song.name)
                Text(song.singer)
            }
            Spacer()
        }
    }
}


struct SongRow_Previews: PreviewProvider {
    static var previews: some View {
        SongRow(song: .demoSong)
            .previewLayout(.fixed(width: 300, height: 700))
    }
}
