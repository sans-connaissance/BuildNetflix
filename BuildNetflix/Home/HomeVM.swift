//
//  HomeVM.swift
//  BuildNetflix
//
//  Created by David Malicke on 1/3/22.
//

import Foundation

class HomeVM: ObservableObject {
    
    // String == Category
    @Published var movies: [String: [Movie]] = [:]
    
    //This pulls the keys from the movies dictionary and returns an array of strings
    public var allCategories: [String] {
        movies.keys.map({ String($0) })
    }
    
    public var allGenres: [HomeGenre]  = [.AllGenres, .Action, .Comedy, .Dystopian, .Thriller, .Weird]
    init() {
        setupMovies()
    }
    
    public func getMovie(forCat cat: String, andHomeRow homeRow: HomeTopRow, andGenre genre: HomeGenre) -> [Movie] {
        
        switch homeRow {
        case .home:
            return movies[cat] ?? []
        case .tvShows:
            return (movies[cat] ?? []).filter({ ($0.movieType == .tvShow) && ($0.genre == genre) })
        case .movies:
            return (movies[cat] ?? []).filter({ ($0.movieType == .movie) && ($0.genre == genre) })
        case .myList:
            return movies[cat] ?? []
        }
    }
    
    func setupMovies() {
        movies["Trending Now"] = exampleMovies
        movies["Stand-up Comedy"] = exampleMovies.shuffled()
        movies["Sci-fi"] = exampleMovies.shuffled()
        movies["Horror"] = exampleMovies.shuffled()
        
    }
}
