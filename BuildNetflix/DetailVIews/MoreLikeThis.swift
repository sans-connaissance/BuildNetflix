//
//  MoreLikeThis.swift
//  BuildNetflix
//
//  Created by David Malicke on 1/8/22.
//

import SwiftUI
import simd

struct MoreLikeThis: View {
    
    var movies: [Movie]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                
                ForEach(0..<movies.count) { index in
                    StandardHomeMovie(movie: movies[index])
                    
                }
            }
        }
    }
}

struct MoreLikeThis_Previews: PreviewProvider {
    static var previews: some View {
        MoreLikeThis(movies: exampleMovies)
    }
}
