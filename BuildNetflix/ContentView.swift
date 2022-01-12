//
//  ContentView.swift
//  BuildNetflix
//
//  Created by David Malicke on 1/3/22.
//

import SwiftUI

struct ContentView: View {
    
    //very very cool!
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor.black
        
    }
    
    var body: some View {
        

        
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }.tag(0)
            //SearchBar()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }.tag(1)
            Text("Coming Soon")
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("Coming Soon")
                }.tag(2)
            Text("Downloads")
                .tabItem {
                    Image(systemName: "arrow.down.to.line.alt")
                    Text("Downloads")
                }.tag(3)
            Text("More")
                .tabItem {
                    Image(systemName: "equal")
                    Text("More")
                }.tag(4)
            
        }
        .accentColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
