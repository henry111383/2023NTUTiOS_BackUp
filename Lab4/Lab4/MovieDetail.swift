//
//  MovieDetail.swift
//  Lab4
//
//  Created by Jing Han on 2023/4/10.
//

import SwiftUI

struct MovieDetail: View {
    let movie: Movie
    var body: some View {
        ScrollView {
            VStack {
                movieImage(movie: movie)
                Text(movie.name)
                    .font(.title)
                    .padding(10)
                Text("上映年份：\(movie.year)")
                    .font(.title)
                Text(movie.introduction)
                    .padding()
            }
            .navigationTitle(movie.name)
        }
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: .demomovie)
    }
}

struct movieImage: View {
    let movie: Movie
    var body: some View {
        Image(movie.name)
            .resizable()
            .scaledToFit()
            .padding(30)
    }
}
