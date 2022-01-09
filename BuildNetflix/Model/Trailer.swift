//
//  Trailer.swift
//  BuildNetflix
//
//  Created by David Malicke on 1/8/22.
//

import Foundation

struct Trailer: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var name: String
    var videoURL: URL
    var thumbnailImageURL: URL
    
}
