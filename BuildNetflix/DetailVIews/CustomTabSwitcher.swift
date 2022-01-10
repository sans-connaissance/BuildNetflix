//
//  CustomTabSwitcher.swift
//  BuildNetflix
//
//  Created by David Malicke on 1/8/22.
//

import SwiftUI

struct CustomTabSwitcher: View {
    
    @State private var currentTab: CustomTab = .episodes
    @Binding var showSeasonPicker: Bool
    @Binding var selectedSeason: Int
    
    var tabs: [CustomTab]
    var movie: Movie
    
    
    func widthForTab(_ tab: CustomTab) -> CGFloat {
        let string = tab.rawValue
        return string.widthOfString(usingFont: .systemFont(ofSize: 16, weight: .bold))
    }
    
    var body: some View {
        VStack {
            // Scrollabe picker
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(tabs, id: \.self) { tab in
                        VStack {
                            Rectangle()
                                .frame(width: widthForTab(tab), height: 6)
                                .foregroundColor(tab == currentTab ? Color.red : Color.clear)
                            
                            Button {
                                currentTab = tab
                            } label: {
                                Text(tab.rawValue)
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(tab == currentTab ? Color.white : Color.gray)
                            }
                            .buttonStyle(.plain)
                            .frame(width: widthForTab(tab), height: 30)
                        }
                    }
                }
            }
            // selected view
            // these do no have scroll views because they will be within the scrollview of the parent when this view is embedded later
            switch currentTab {
            case .episodes:
                EpisodesView(showSeasonPicker: $showSeasonPicker, selectedSeason: $selectedSeason, episodes: movie.episodes ?? [])
            case .trailers:
                TrailerList(trailers: movie.trailers)
            case .more:
                MoreLikeThis(movies: movie.moreLikeThisMovies)
            }
        }
        .foregroundColor(.white)
    }
}


enum CustomTab: String {
    case episodes = "EPISODES"
    case trailers = "TRAILERS & MORE"
    case more = "MORE LIKE THIS"
    
}

struct CustomTabSwitcher_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            CustomTabSwitcher(showSeasonPicker: .constant(true), selectedSeason: .constant(1), tabs: [.episodes, .trailers, .more], movie: exampleMovie1)
        }
        
    }
}
