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
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
                
            
            // main VStack
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    
                    TopRowButtons()
                    
                    TopMoviePreview(movie: exampleMovie4)
                        .frame(width: screen.width)
                        .padding(.top, -110)
                        .zIndex(-1)
                    
                    ForEach(vm.allCategories, id: \.self) { category in
                        VStack {
                            HStack {
                                Text(category)
                                    .font(.title3)
                                    .bold()
                                Spacer()
                            }
                            ScrollView(.horizontal, showsIndicators: false) {
                                //This lazy hstack is optional
                                LazyHStack{
                                    ForEach(vm.getMovie(forCat: category)) { movie in
                                        StandardHomeMovie(movie: movie)
                                            .frame(width: 100, height: 200)
                                            .padding(.horizontal, 20)
                                        
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .foregroundColor(.white)
    }
}

struct TopRowButtons: View {
    var body: some View {
        HStack {
            Button {
                //
            } label: {
                Image("netflix_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
            }
            Spacer()
            Button {
                //
            } label: {
                Text("TV Shows")
            }
            Spacer()
            Button {
                //
            } label: {
                Text("Movies")
            }
            Spacer()
            Button {
                //
            } label: {
                Text("My List")
            }
            
        }
        .padding(.leading, 10)
        .padding(.trailing, 30)
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
