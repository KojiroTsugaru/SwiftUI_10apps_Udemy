//
//  HomeScreenView.swift
//  linkedinUIClone06
//
//  Created by KJ on 1/2/23.
//

import SwiftUI

struct HomeScreenView: View {
    var body: some View {
        VStack{
            HomeTopView()
            PostView()
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
