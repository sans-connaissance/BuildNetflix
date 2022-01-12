//
//  SearchView.swift
//  BuildNetflix
//
//  Created by David Malicke on 1/11/22.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var vm = SearchVM()
    
    @State private var searchText = ""
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            VStack {
                SearchBar(text: $searchText, isLoading: $vm.isLoading)
                    .padding()
                
                Spacer()
                
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
