//
//  SearchBar.swift
//  linkedinUIClone06
//
//  Created by KJ on 12/31/22.
//

import SwiftUI

struct SearchBar: View {
    var body: some View {
        HStack {
            Image("demo")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .frame(width: 50, height: 50)
            
            RoundedRectangle(cornerRadius:12)
                .foregroundColor(.blue).opacity(0.2)
                .frame(width: 270, height: 30)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                            .font(.body)
                            Spacer()
                    }.padding()
                )
            
            Image(systemName: "ellipses.bubble.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .padding(.horizontal)
        }.padding(.top)
        
    } 
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
