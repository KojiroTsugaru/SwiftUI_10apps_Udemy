//
//  TodoApp07App.swift
//  TodoApp07
//
//  Created by KJ on 1/3/23.
//

import SwiftUI

@main
struct TodoApp07App: App {
    
    @StateObject var list: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }.environmentObject(ListViewModel())
        }
    }
}
