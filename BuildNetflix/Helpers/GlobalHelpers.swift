//
//  GlobalHelpers.swift
//  BuildNetflix
//
//  Created by David Malicke on 1/3/22.
//

import Foundation
import SwiftUI

let exampleVideoURL = URL(string: "https://www.youtube.com/watch?v=2WDoyn6POaM")!

let exampleImageURL = URL(string: "https://picsum.photos/300/102")!
let exampleImageURL2 = URL(string: "https://picsum.photos/300/103")!
let exampleImageURL3 = URL(string: "https://picsum.photos/300/104")!

let exampleTrailer1 = Trailer(name: "Season 3 Trailer", videoURL: exampleVideoURL, thumbnailImageURL: randomExampleImageURL)
let exampleTrailer2 = Trailer(name: "Hero's Journey", videoURL: exampleVideoURL, thumbnailImageURL: randomExampleImageURL)
let exampleTrailer3 = Trailer(name: "The best show ever", videoURL: exampleVideoURL, thumbnailImageURL: randomExampleImageURL)

var randomExampleImageURL: URL {
    return [exampleImageURL, exampleImageURL2, exampleImageURL3].randomElement() ?? exampleImageURL
}

let exampleTrailers = [exampleTrailer1, exampleTrailer2, exampleTrailer3]

let episode1 = Episode(
    name: "Spiderman returns",
    season: 1,
    episodeNumber: 1,
    thumbnailImageURLString: "https://picsum.photos/300/102",
    description: "hey look, spiderman came back and it's a big deal for everyone involved",
    length: 54,
    videoURL: exampleImageURL)

let episode2 = Episode(
    name: "Spiderman is in trouble",
    season: 1,
    episodeNumber: 2,
    thumbnailImageURLString: "https://picsum.photos/300/102",
    description: "Spiderman is in trouble, will he be able to get out of this trouble? Tune in to find out",
    length: 54,
    videoURL: exampleImageURL)

let episode3 = Episode(
    name: "The one with Spiderman",
    season: 1,
    episodeNumber: 3,
    thumbnailImageURLString: "https://picsum.photos/300/102",
    description: "Spiderman and Ross decide to help Joey get an audition. Rachel and Monica help Chandler say hi to Spiderman with confidence.",
    length: 54,
    videoURL: exampleImageURL)

let episode4 = Episode(
    name: "Spiderman returns",
    season: 2,
    episodeNumber: 1,
    thumbnailImageURLString: "https://picsum.photos/300/108",
    description: "hey look, spiderman came back and it's a big deal for everyone involved",
    length: 54,
    videoURL: exampleImageURL)

let episode5 = Episode(
    name: "Spiderman is in trouble",
    season: 2,
    episodeNumber: 2,
    thumbnailImageURLString: "https://picsum.photos/300/109",
    description: "Spiderman is in trouble, will he be able to get out of this trouble? Tune in to find out",
    length: 54,
    videoURL: exampleImageURL)

let episode6 = Episode(
    name: "The one with Spiderman",
    season: 2,
    episodeNumber: 3,
    thumbnailImageURLString: "https://picsum.photos/300/101",
    description: "Spiderman and Ross decide to help Joey get an audition. Rachel and Monica help Chandler say hi to Spiderman with confidence.",
    length: 54,
    videoURL: exampleImageURL)

var allExampleEpisodes = [episode1, episode2, episode3, episode4, episode5, episode6 ]


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
    moreLikeThisMovies: [exampleMovie3, exampleMovie4],
    promotionHeadline: "Watch this now!",
    trailers: exampleTrailers)

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
    moreLikeThisMovies: [ exampleMovie5, exampleMovie6],
    promotionHeadline: "Season 3 won awards!",
    trailers: exampleTrailers)

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
    moreLikeThisMovies: [],
    promotionHeadline: "Don't miss this!",
    trailers: exampleTrailers)

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
    cast: "Katie Malicke, Jojo Malicke",
    moreLikeThisMovies: [],
    trailers: exampleTrailers)

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
    cast: "Katie Malicke, Jojo Malicke",
    moreLikeThisMovies: [],
    trailers: exampleTrailers)

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
    cast: "Katie Malicke, Jojo Malicke",
    moreLikeThisMovies: [],
    trailers: exampleTrailers)


var exampleMovies: [Movie] { [exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6].shuffled() }

let exampleEpisodeInfo1 = CurrentEpisodeInfo(episodeName: "Begin and end", description: "Five days before the end of this tutorial, I started to think about doing another tutorial", season: 1, episode: 1)


extension LinearGradient {
    static let blackOpacityGradient = LinearGradient(
        gradient: Gradient(colors: [Color.black.opacity(0.0), Color.black.opacity(0.95)]),
        startPoint: .top,
        endPoint: .bottom)
}

/// from https://www.udemy.com/course/swiftui-netflix
extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}
