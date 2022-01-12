//
//  SearchResultsGrid.swift
//  BuildNetflix
//
//  Created by David Malicke on 1/12/22.
//

import SwiftUI

struct SearchResultsGrid: View {
    
    var movies: [Movie]
    @Binding var movieDetailToShow: Movie?
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(movies, id: \.id) { movie in
                StandardHomeMovie(movie: movie)
                    .frame(height: 160)
                    .onTapGesture {
                        movieDetailToShow = movie
                    }
                
            }
            
        }
    }
}

struct SearchResultsGrid_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            SearchResultsGrid(movies: generateMovies(20), movieDetailToShow: .constant(nil))
        }
    }
}