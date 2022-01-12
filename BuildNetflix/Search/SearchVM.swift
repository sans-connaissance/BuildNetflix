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
        
        getSearchResults(forText: text)
    }
    
    
    private func getPopularMovies() {
        
        
    }
    
    private func getSearchResults(forText text: String) {
        
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
