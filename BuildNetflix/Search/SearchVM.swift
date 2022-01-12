//
//  SearchVM.swift
//  BuildNetflix
//
//  Created by David Malicke on 1/11/22.
//

import Foundation
import SwiftUI

class SearchVM: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var viewState: ViewState = ViewState.ready
    @Published var popularMovies: [Movie] = []
    @Published var searchResults: [Movie] = []
    @Published var isShowingPopularMovies = true
    
    init() {
        getPopularMovies()
    }
    
    public func updateSearchText(with text: String) {
        setViewState(to: .loading)
        
        if text.count > 0 {
            isShowingPopularMovies = false
            getSearchResults(forText: text)
        }
    }
    
    
    private func getPopularMovies() {
        popularMovies = generateMovies(40)
        
    }
    
    private func getSearchResults(forText text: String) {
        
        let haveResult = Int.random(in: 0...3)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if haveResult == 0 {
                self.searchResults = []
                self.setViewState(to: .empty)
            } else {
                let movies = generateMovies(21)
                self.searchResults = movies
                self.setViewState(to: .ready)
            }
        }
    }
    
    private func setViewState(to state: ViewState) {
        // this essentially binds the viewState and isLoading variables.
        DispatchQueue.main.async {
            self.viewState = state
            self.isLoading = state == .loading
        }
    }
}

enum ViewState {
    case empty
    case loading
    case ready
    case error
    
}
