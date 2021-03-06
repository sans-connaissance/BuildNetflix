//
//  SearchBar.swift
//  BuildNetflix
//
//  Created by David Malicke on 1/11/22.
//

import SwiftUI

struct SearchBar: View {
    
    // the search bar is a little weird
    
    @Binding  var text: String
    @State private var isEditing = true
    @Binding  var isLoading: Bool
    
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color.graySearchBackground
                .frame(width:270, height: 36)
                .cornerRadius(8)
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.graySearchText)
                    .padding(.leading, 10)
                TextField("Search", text: $text)
                    .padding(7)
                    .padding(.leading, -7)
                    .background(Color.graySearchBackground)
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .onTapGesture {
                        isEditing = true
                    }
                    .animation(.default)
                
                if !text.isEmpty {
                    if isLoading {
                        Button {
                            text = ""
                        } label: {
                            ActivityIndicator(style: .medium, animate: .constant(true))
                                .configure{$0.color = .white}
                            
                        }
                        .padding(.trailing, 32)
                        .frame(width: 35, height: 35)
                        
                    } else {
                        
                        Button {
                            text = ""
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.graySearchText)
                                .frame(width: 35, height: 35)
                        }
                        .padding(.trailing, 18)
                    }
                }
                
                if isEditing {
                    Button {
                        text = ""
                        isEditing = false
                        hideKeyBoard()
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.white)
                    }
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
                }
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            SearchBar(text: .constant(""), isLoading: .constant(false))
                .padding()
        }
        
    }
}
