//
//  SongDetail.swift
//  peter_Demo
//
//  Created by Jing Han on 2023/4/10.
//

import SwiftUI

struct SongDetail: View {
    let song: Song
    var body: some View {
        VStack {
            SongImage(song: song)
            Text(song.lyrics)
                .padding()
        }
        .navigationTitle(song.name)
    }
}

struct SongDetail_Previews: PreviewProvider {
    static var previews: some View {
        SongDetail(song: .demoSong)
    }
}

struct SongImage: View {
    let song: Song
    var body: some View {
        Image(song.name)
            .resizable()
            .scaledToFit()
    }
}
