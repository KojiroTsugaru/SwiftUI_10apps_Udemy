//
//  TabView.swift
//  linkedinUIClone06
//
//  Created by KJ on 1/2/23.
//

import SwiftUI

struct TabScreen: View {
    var body: some View {
        TabView() {
            HomeScreenView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            MyNetworkView()
                .tabItem {
                    Image(systemName: "person.2.fill")
                    Text("MyNetwork")
                }
            Text("Post")
                .tabItem{
                    Image (systemName: "plus.app.fill")
                    Text("Post")
                 }
            
            Text("Notifications")
                .tabItem{
                    Image(systemName: "bell.badge.fill")
                    Text("Notifications")
                 }
            
            Text("Jobs")
                .tabItem{
                    Image(systemName:"briefcase.fill")
                    Text("Jobs")
            }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabScreen()
    }
}
