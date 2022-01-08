//
//  MovieDetail.swift
//  BuildNetflix
//
//  Created by David Malicke on 1/8/22.
//

import SwiftUI

struct MovieDetail: View {
    var movie: Movie
    let screen = UIScreen.main.bounds

    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)

            VStack {
                HStack {
                    Spacer()
                    Button {
                        //
                    } label: {
                        Image(systemName: "xmark.circle")
                            .font(.system(size: 28))
                    }
                }.padding(.horizontal, 22)

                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        StandardHomeMovie(movie: movie)
                            .frame(width: screen.width / 2.5)

                        MovieInfoSubheadline(movie: movie)

                        if movie.promotionHeadline != nil {
                            Text(movie.promotionHeadline!)
                                .bold()
                                .font(.headline)
                        } else {
                            Text("Play Now")
                                .bold()
                                .font(.headline)
                        }

                        PlayButton(text: "Play", imageName: "play.fill") {
                            //
                        }
                        CurrentEpisodeInformation(movie: movie)
                        /// Cast and creators would have to be it's own iterable struct in a real app
                        CastInfo(movie: movie)
                    }
                    .padding(.horizontal, 10)
                }
                Spacer()
            }
            .foregroundColor(.white)
        }
    }
}

struct MovieInfoSubheadline: View {
    var movie: Movie
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "hand.thumbsup.fill")
                .foregroundColor(.white)

            Text(String(movie.year))

            RatingView(rating: movie.rating)

            Text(movie.numberOfSeasonsDisplay)
        }
        .foregroundColor(.gray)
        .padding(.vertical, 6)
    }
}

struct RatingView: View {
    var rating: String
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)

            Text(rating)
                .foregroundColor(.white)
                .font(.system(size: 12))
                .bold()
        }
        .frame(width: 50, height: 20)
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: exampleMovie6)
    }
}

struct CastInfo: View {
    var movie: Movie
    var body: some View {
        VStack(spacing: 3) {
            HStack {
                Text("Cast: \(movie.cast)")
                Spacer()
            }
            HStack {
                Text("Creators: \(movie.creators)")
                Spacer()
            }
        }
        .font(.caption)
        .foregroundColor(.gray)
        .padding(.vertical, 10)
    }
}

struct CurrentEpisodeInformation: View {
    var movie: Movie
    var body: some View {
        Group {
            HStack {
                Text(movie.episodeInfoDisplay)
                    .bold()
                Spacer()
            }.padding(.vertical, 4)
            HStack {
                Text(movie.episodeDescriptionDisplay)
                    .font(.subheadline)

                Spacer()
            }
        }
    }
}
