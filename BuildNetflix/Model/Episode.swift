//
//  Episode.swift
//  BuildNetflix
//
//  Created by David Malicke on 1/8/22.
//

import Foundation

struct Episode: Identifiable {
    var id = UUID().uuidString
    
    var name: String
    var season: Int
    var thumbnailImageURLString: String
    var description: String
    var length: Int
    
    /// in production this should safely unwrap and throw an error message if it doesn't work out.
    var thumbnailURL: URL {
        return URL(string: thumbnailImageURLString)!
    }
}
