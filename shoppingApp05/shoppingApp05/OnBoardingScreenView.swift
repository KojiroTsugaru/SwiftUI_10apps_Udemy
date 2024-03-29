//
//  OnBoardingScreenView.swift
//  shoppingApp05
//
//  Created by KJ on 12/29/22.
//

import SwiftUI

struct OnBoardingScreenView: View {
    var body: some View {
        NavigationView{
            VStack(spacing: 30) {
                Spacer()
                Image("img")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding()
                    .frame(height: 320, alignment: .center)
                VStack(alignment: .leading, spacing: 10) {
                    Text("Order you Favorite Fruits")
                        .font(.system(.largeTitle))
                        .bold()
                    Text("Eat Fresh Fruits and try to be healthy")
                        .font(.system(.title3))
                        .foregroundColor(.black.opacity(0.8))
                }.padding()
                Spacer()
                NavigationLink(destination: HomeScreen()
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)) {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color("6"))
                        .frame(width: 280, height: 60, alignment: .trailing)
                        .overlay(
                            HStack(spacing: 10) {
                                Text("Next")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Image(systemName: "chevron.right")
                            }.foregroundColor(.black)
                        )
                };
                    Spacer()
                }
            .navigationBarHidden(true)
            }
        }
    }


struct OnBoardingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingScreenView()
    }
}
