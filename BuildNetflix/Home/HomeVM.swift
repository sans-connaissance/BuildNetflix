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
    
    init() {
        setupMovies()
    }
    
    public func getMovie(forCat cat: String) -> [Movie] {
        movies[cat] ?? []
    }
    
    func setupMovies() {
        movies["Trending Now"] = exampleMovies
        
    }
}
