//
//  VideoPreviewImage.swift
//  BuildNetflix
//
//  Created by David Malicke on 1/9/22.
//

import SwiftUI
import Kingfisher

struct VideoPreviewImage: View {
    @State private var showingVideoPlayer = false
    
    var imageURL: URL
    var videoURL: URL
    
    var body: some View {
        ZStack {
            KFImage(imageURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            Button {
                showingVideoPlayer = true
            } label: {
                Image(systemName: "play.circle")
                    .foregroundColor(.white)
                    .font(.system(size: 40))
            }
            .sheet(isPresented: $showingVideoPlayer) {
                SwiftUIVideoView(url: videoURL)
            }
        }
    }
}

struct VideoPreviewImage_Previews: PreviewProvider {
    static var previews: some View {
        VideoPreviewImage(imageURL: exampleImageURL, videoURL: exampleVideoURL)
    }
}
