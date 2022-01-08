//
//  GlobalHelpers.swift
//  BuildNetflix
//
//  Created by David Malicke on 1/3/22.
//

import Foundation
import SwiftUI

let exampleMovie1 = Movie(
    id: UUID().uuidString,
    name: "Dark",
    thumbnailURL: URL(string: "https://picsum.photos/200/300")!,
    categories: ["Dystopian", "Exciting", "Weird"],
    year: 2020,
    rating: "TV-13",
    numberOfSeasons: 1,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Frankfurt Industries",
    cast: "Katie Malicke, Jojo Malicke",
    promotionHeadline: "Watch this now!")

let exampleMovie2 = Movie(
    id: UUID().uuidString,
    name: "Trave",
    thumbnailURL: URL(string: "https://picsum.photos/200/301")!, categories: ["Dystopian", "Exciting", "Weird"],
    year: 2020,
    rating: "TV-13",
    numberOfSeasons: 3,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Frankfurt Industries",
    cast: "Katie Malicke, Jojo Malicke",
    promotionHeadline: "Season 3 won awards!")

let exampleMovie3 = Movie(
    id: UUID().uuidString,
    name: "Hannibal",
    thumbnailURL: URL(string: "https://picsum.photos/200/302")!,
    categories: ["Dystopian","Exciting", "Weird"],
    year: 2020,
    rating: "TV-13",
    numberOfSeasons: 4,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Frankfurt Industries",
    cast: "Katie Malicke, Jojo Malicke",
    promotionHeadline: "Don't miss this!")

let exampleMovie4 = Movie(
    id: UUID().uuidString,
    name: "Alone",
    thumbnailURL: URL(string: "https://picsum.photos/200/303")!,
    categories: ["Dystopian", "Exciting", "Weird"],
    year: 2020,
    rating: "TV-13",
    numberOfSeasons: 4,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Frankfurt Industries",
    cast: "Katie Malicke, Jojo Malicke")

let exampleMovie5 = Movie(
    id: UUID().uuidString,
    name: "AfterLife",
    thumbnailURL: URL(string: "https://picsum.photos/200/304")!,
    categories: ["Dystopian", "Exciting", "Weird"],
    year: 2020,
    rating: "TV-13",
    numberOfSeasons: 2,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Frankfurt Industries",
    cast: "Katie Malicke, Jojo Malicke")

let exampleMovie6 = Movie(
    id: UUID().uuidString,
    name: "what!?",
    thumbnailURL: URL(string: "https://picsum.photos/200/305")!,
    categories: ["Dystopian", "Exciting", "Weird"],
    year: 2020,
    rating: "TV-13",
    numberOfSeasons: 3,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Frankfurt Industries",
    cast: "Katie Malicke, Jojo Malicke")


let exampleMovies: [Movie] = [exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6]

let exampleEpisodeInfo1 = CurrentEpisodeInfo(episodeName: "Begin and end", description: "Five days before the end of this tutorial, I started to think about doing another tutorial", season: 1, episode: 1)


extension LinearGradient {
    static let blackOpacityGradient = LinearGradient(
        gradient: Gradient(colors: [Color.black.opacity(0.0), Color.black.opacity(0.95)]),
        startPoint: .top,
        endPoint: .bottom)
    
}
