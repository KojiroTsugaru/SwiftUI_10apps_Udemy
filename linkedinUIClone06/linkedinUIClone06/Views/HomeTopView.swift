//
//  HomeTopView.swift
//  linkedinUIClone06
//
//  Created by KJ on 1/2/23.
//

import SwiftUI

struct HomeTopView: View {
    var body: some View {
        VStack(alignment: .leading) {
            SearchBar()
            Divider()
            HStack{
                Image(systemName: "square.and.pencil")
                Text("Share a post")
            }.padding(.horizontal)
            Divider()

            HStack{
                Image (systemName: "photo")
                    .foregroundColor(.blue)
                Text ("Photo")
                Spacer()
                Image (systemName: "video.fill")
                    .foregroundColor(.green)
                Text ("Image")
                Spacer()
                Image (systemName: "calendar")
                    .foregroundColor(.orange)
                Text ("Event")
            }.padding(.horizontal)
        }
    }
}

struct HomeTopView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTopView()
    }
}
