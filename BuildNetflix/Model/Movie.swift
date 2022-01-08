//
//  Movie.swift
//  BuildNetflix
//
//  Created by David Malicke on 1/3/22.
//

import Foundation

struct Movie: Identifiable {
    var id: String
    var name: String
    var thumbnailURL: URL
    
    var categories: [String]
    
    ///MovieDetail View
    var year: Int
    var rating: String
    var numberOfSeasons: Int?
    
    var numberOfSeasonsDisplay: String {
        if let num = numberOfSeasons {
            if num == 1 {
                return "1 season"
            } else {
                return "\(num) seasons"
            }
        }
        return ""
    }
    
}
