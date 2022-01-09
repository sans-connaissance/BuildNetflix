//
//  TrailerList.swift
//  BuildNetflix
//
//  Created by David Malicke on 1/9/22.
//

import SwiftUI

struct TrailerList: View {
    var trailers: [Trailer]
    let screen  = UIScreen.main.bounds
    
    var body: some View {
        VStack {
            ForEach(trailers) { trailer in
                VStack(alignment: .leading) {
                    VideoPreviewImage(imageURL: trailer.thumbnailImageURL, videoURL: trailer.videoURL)
                    /// using MaxWidth here allows us to make it smaller in other frames
                        .frame(maxWidth: screen.width)
                    
                    Text(trailer.name)
                        .font(.headline)
                    
                }
                .foregroundColor(.white)
            }
        }
    }
}

struct TrailerList_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            TrailerList(trailers: exampleTrailers)
        }
    }
}
