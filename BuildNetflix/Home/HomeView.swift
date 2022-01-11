//
//  HomeView.swift
//  BuildNetflix
//
//  Created by David Malicke on 1/3/22.
//

import SwiftUI

struct HomeView: View {
    var vm = HomeVM()
    
    let screen = UIScreen.main.bounds
    
    @State private var movieDetailToShow: Movie? = nil
    @State private var topRowSelection: HomeTopRow = .home
    @State private var homeGenre: HomeGenre = .AllGenres
    @State private var showGenreSelection = false
    @State private var showTopRowSelection = false
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            
            // main VStack
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    
                    TopRowButtons(topRowSelection: $topRowSelection, homeGenre: $homeGenre, showGenreSelection: $showGenreSelection, showTopRowSelection: $showTopRowSelection)
                    
                    TopMoviePreview(movie: exampleMovie4)
                        .frame(width: screen.width)
                        .padding(.top, -110)
                        .zIndex(-1)
                    
                    HomeStack(vm: vm, topRowSelection: topRowSelection, selectedGenre: homeGenre , movieDetailToShow: $movieDetailToShow)
                }
            }
            // the if != nil is a safe check to ensure that the movedetailtoshow is unwrapped
            if movieDetailToShow != nil {
                MovieDetail(movieDetailToShow: $movieDetailToShow, movie: movieDetailToShow!)
                //MARK TO DO: Change to navigation link or fullScreen Cover
                    .animation(.default)
                    .transition(.opacity)
            }
            
            if showTopRowSelection {
                Group {
                    Color.black.opacity(0.9)
                    VStack(spacing: 40) {
                        Spacer()
                        ForEach(HomeTopRow.allCases, id: \.self) { topRow in
                            
                            Button {
                                topRowSelection = topRow
                                showTopRowSelection = false
                                
                            } label: {
                                if topRow == topRowSelection {
                                    Text("\(topRow.rawValue)")
                                        .bold()
                                } else {
                                    Text("\(topRow.rawValue)")
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                        Spacer()
                        Button {
                            showTopRowSelection = false
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 40))
                        }.padding(.bottom, 30)
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .font(.title2)
            }
            
            if showGenreSelection {
                Group {
                    Color.black.opacity(0.9)
                    //scrollViews are a single element so the 40 spacing is only being applied to the scrollview and the button not each button in the scroll view
                    VStack(spacing: 40) {
                        Spacer()
                        ScrollView {
                            ForEach(vm.allGenres, id: \.self) { genre in
                                
                                Button {
                                    homeGenre = genre
                                    showGenreSelection = false
                                    
                                } label: {
                                    if genre == homeGenre {
                                        Text("\(genre.rawValue)")
                                            .bold()
                                    } else {
                                        Text("\(genre.rawValue)")
                                            .foregroundColor(.gray)
                                    }
                                }
                                .padding(.bottom, 40)
                            }
                        }
                        Spacer()
                        Button {
                            showGenreSelection = false
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 40))
                        }.padding(.bottom, 30)
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .font(.title2)
            }
            
        }
        .foregroundColor(.white)
    }
}

struct TopRowButtons: View {
    
    @Binding var topRowSelection: HomeTopRow
    @Binding var homeGenre: HomeGenre
    @Binding var showGenreSelection: Bool
    @Binding var showTopRowSelection: Bool
    
    
    var body: some View {
        switch topRowSelection {
        case .home:
            HStack {
                Button {
                    topRowSelection = .home
                } label: {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                }
                Spacer()
                Button {
                    topRowSelection = .tvShows
                } label: {
                    Text("TV Shows")
                }
                Spacer()
                Button {
                    topRowSelection = .movies
                } label: {
                    Text("Movies")
                }
                Spacer()
                Button {
                    topRowSelection = .myList
                } label: {
                    Text("My List")
                }
                
            }
            .padding(.leading, 10)
            .padding(.trailing, 30)
            
        case .tvShows, .movies, .myList:
            HStack {
                Button {
                    topRowSelection = .home
                } label: {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                }
                
                HStack(spacing: 20) {
                    Button {
                        showTopRowSelection = true
                    } label: {
                        HStack {
                            Text(topRowSelection.rawValue)
                                .font(.system(size: 18))
                            Image(systemName: "triangle.fill")
                                .font(.system(size: 10))
                                .rotationEffect(.degrees(180), anchor: .center)
                        }
                    }
                    
                    
                    Button {
                        showGenreSelection = true
                    } label: {
                        HStack {
                            Text(homeGenre.rawValue)
                                .font(.system(size: 12))
                            Image(systemName: "triangle.fill")
                                .font(.system(size: 6))
                                .rotationEffect(.degrees(180), anchor: .center)
                        }
                    }
                    Spacer()
                }
                
            }
            .padding(.leading, 30)
            .padding(.trailing, 30)
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

enum HomeTopRow: String, CaseIterable {
    
    case home = "Home"
    case tvShows = "TV Shows"
    case movies = "Movies"
    case myList = "My List"
    
}


enum HomeGenre: String {
    case AllGenres
    case Action
    case Comedy
    case Horror
    case Thriller
    case Exciting
    case Dystopian
    case Weird
}


