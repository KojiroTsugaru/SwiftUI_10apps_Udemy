//
//  HomeScreen.swift
//  shoppingApp05
//
//  Created by KJ on 12/29/22.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        Text("this is home screen")
            .font(.system(size: 60))
            .bold()
            .frame(alignment: .center)
        TopSellingView()
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
