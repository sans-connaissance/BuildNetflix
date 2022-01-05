//
//  TopMoviePreview.swift
//  BuildNetflix
//
//  Created by David Malicke on 1/5/22.
//

import Kingfisher
import SwiftUI

struct TopMoviePreview: View {
    var movie: Movie
    
    var body: some View {
        ZStack {
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
                .clipped()
            
            VStack {
                Spacer()
                Text("Strings for Categories")
                Text("Categories")
            }
        }
        .foregroundColor(.white)
    }
}

struct TopMoviePreview_Previews: PreviewProvider {
    static var previews: some View {
        TopMoviePreview(movie: exampleMovie2)
    }
}
