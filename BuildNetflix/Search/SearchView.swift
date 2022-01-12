//
//  SearchView.swift
//  BuildNetflix
//
//  Created by David Malicke on 1/11/22.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var vm = SearchVM()
    
    @State private var searchText = ""
    
    @State private var movieDetailToShow: Movie? = nil
    
    var body: some View {
        
        let searchTextBinding = Binding {
            //can remove curse words here
            return searchText
        } set: {
            
            //can also do stuff here before functions are run
            searchText = $0
            vm.updateSearchText(with: $0)
        }
        
        // is this additional return really necessary?
        return ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            VStack {
                SearchBar(text: searchTextBinding, isLoading: $vm.isLoading)
                    .padding()
                ScrollView {
                    if vm.isShowingPopularMovies {
                        PopularList(movies: vm.popularMovies, movieDetailToShow: $movieDetailToShow)
                    }
                    
                    if vm.viewState == .empty {
                        Text("Your search did not have any results")
                            .bold()
                            .padding(.top, 150)
                            .font(.title3)
                    } else if vm.viewState == .ready && !vm.isShowingPopularMovies{
                       
                        VStack {
                            HStack {
                                Text("Movies & TV")
                                    .bold()
                                    .font(.title3)
                                    .padding(.leading, 12)
                                Spacer()
                            }
                            SearchResultsGrid(movies: vm.searchResults, movieDetailToShow: $movieDetailToShow)
                        }
                    }
                    
                    
                }
                Spacer()
                
            }
            //this check allows for force unwrap later
            if movieDetailToShow != nil {
                MovieDetail(movieDetailToShow: $movieDetailToShow, movie: movieDetailToShow!)
            }
            
        }
        .foregroundColor(.white)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct PopularList: View {
    var movies: [Movie]
    @Binding var movieDetailToShow: Movie?
    
    var body: some View {
        VStack {
            HStack {
                Text("Popular Searches")
                    .bold()
                    .font(.title3)
                    .padding(.leading, 12)
                Spacer()
            }
            LazyVStack {
                //used .id to identify themselves rather than movie being hashable
                ForEach(movies, id: \.id) { movie in
                    PopularMovieView(movie: movie, movieDetailToShow: $movieDetailToShow)
                        .frame(height: 75)
                }
            }
        }
    }
}
