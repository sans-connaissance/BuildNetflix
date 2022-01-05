//
//  TopMoviePreview.swift
//  BuildNetflix
//
//  Created by David Malicke on 1/5/22.
//

import Kingfisher
import SwiftUI

struct TopMoviePreview: View {
    var movie: Movie
    
    // This is not in a view model because it is a func for displaying UI elements. And a seperate VM here might be confusing, since it would just have one func...
    func isCategoryLast(_ cat: String) -> Bool {
        let catCount = movie.categories.count
        
        if let index = movie.categories.firstIndex(of: cat) {
            if index + 1 != catCount {
                return false
            }
        }
        return true
    }
    
    var body: some View {
        ZStack {
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
                .clipped()
            
            VStack {
                Spacer()
                HStack {
                    ForEach(movie.categories, id: \.self) { category in
                        HStack {
                            Text(category)
                                .font(.footnote)
                            
                            if !isCategoryLast(category) {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 3))
                            }
                        }
                    }
                }
                HStack {
                    Spacer()
                    SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true) {
                        // code to add later
                    }
                    Spacer()
                    Text("Play Button")
                    Spacer()
                    SmallVerticalButton(text: "Info", isOnImage: "info.circle", isOffImage: "info.circle", isOn: true) {
                        // code to add later
                    }
                    Spacer()
                }
                
            }
        }
        .foregroundColor(.white)
    }
}

struct TopMoviePreview_Previews: PreviewProvider {
    static var previews: some View {
        TopMoviePreview(movie: exampleMovie2)
    }
}
