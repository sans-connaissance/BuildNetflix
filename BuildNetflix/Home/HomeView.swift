//
//  HomeView.swift
//  BuildNetflix
//
//  Created by David Malicke on 1/3/22.
//

import SwiftUI

struct HomeView: View {
    
    var vm = HomeVM()
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ForEach(vm.allCategories, id: \.self) { category in
                VStack {
                    HStack {
                        Text(category)
                        Spacer()
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack{
                            ForEach(vm.getMovie(forCat: category)) { movie in
                                StandardHomeMovie(movie: movie)
                                
                            }
                        }
                    }
                }
            }
        }
        .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
