//
//  MovieRow.swift
//  Lab4
//
//  Created by Jing Han on 2023/4/10.
//

import SwiftUI

struct MovieRow: View {
    let movie : Movie
    var body: some View {
        HStack {
            Image(movie.name)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipped()
            VStack(alignment: .leading) {
                Text(movie.name)
                Text(movie.year)
            }
            Spacer()
        }
    }
}


struct MovieRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieRow(movie: .demomovie)
            .previewLayout(.fixed(width: 300, height: 700))
    }
}
