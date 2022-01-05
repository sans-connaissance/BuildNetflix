//
//  WhiteButton.swift
//  BuildNetflix
//
//  Created by David Malicke on 1/5/22.
//

import SwiftUI

struct WhiteButton: View {
    var text: String
    var isOnImage: String
    var isOffImage: String
    var isOn: Bool
    
    var imageName: String {
        if isOn {
            return isOnImage
        } else {
            return isOffImage
        }
    }
    
    
    
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Image(systemName: imageName)
                    .foregroundColor(.white)
                Text(text)
                    .foregroundColor(.white)
                    .font(.system(size: 16))
                    .bold()

            }
        }
    }
}

struct WhiteButton_Previews: PreviewProvider {
    static var previews: some View {
        WhiteButton(text: "Play", isOnImage: "triangle", isOffImage: "square", isOn: true) {
            // to add
        }
    }
}
