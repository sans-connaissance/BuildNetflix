//
//  WhiteButton.swift
//  BuildNetflix
//
//  Created by David Malicke on 1/5/22.
//

import SwiftUI

struct PlayButton: View {
    var text: String
    var imageName: String
    ///default color is white if nothing is passed in
    var backgroundColor: Color = Color.white
    
    
    
    
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Spacer()
                Image(systemName: imageName)
                    .font(.headline)
                Text(text)
                    .font(.system(size: 16))
                    .bold()
                Spacer()

            }
            .padding(.vertical, 6)
            .foregroundColor(backgroundColor == .white ? .black : .white)
            .background(backgroundColor)
            .cornerRadius(3.0)
        }
    }
}

struct WhiteButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            PlayButton(text: "Play", imageName: "play.fill") {
                //
            }
        }
    }
}
