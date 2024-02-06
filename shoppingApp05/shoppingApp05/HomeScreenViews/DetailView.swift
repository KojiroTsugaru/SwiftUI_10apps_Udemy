//
//  DetailView.swift
//  shoppingApp05
//
//  Created by KJ on 12/30/22.
//

import SwiftUI

struct DetailView: View {
    
    struct RoundedCornerShape: Shape {
        let corners: UIRectCorner
        let radius: Int
        
        func path(in rect: CGRect) -> Path {
            let path =  UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            
            return Path(path.cgPath)
        }
    }
    
    @State var fruit: fruitTitle
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            Image("bg")
                .resizable()
                .edgesIgnoringSafeArea(.top)
                .clipShape(RoundedCornerShape.init(corners: [.bottomLeft, .bottomRight], radius: 50))
                .edgesIgnoringSafeArea(.all)
                .shadow(color: .gray, radius: 5, x: 5, y: 5)
                .overlay(
                    Image("\(fruit.rawValue)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, height: 250, alignment: .center)
                        .offset(y:50)
                        .shadow(color: .gray, radius: 5, x: 5, y: 5)
                )
            Spacer()
            Text("\(fruit.rawValue) - Medium")
                .fontWeight(.medium)
                .font(.system(.title))
                .padding(.horizontal)
                .textCase(.uppercase)
            Text("Each (500g - 700g)")
                .padding(.horizontal)
            Text("Organic agriculture is intended to produce high quality, nutritious food that contributes to preventive health care and well-being. In view of this, it avoids the use of fertilizers, pesticides, animal drugs and food additives that may have adverse health effects.")
                .font(.body)
                .fontWeight(.regular)
                .multilineTextAlignment(.leading)
                .lineLimit(6)
                .padding(.horizontal)
            HStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color("bgColor"))
                    .opacity(0.15)
                    .overlay(Image(systemName: "hourglass"))
                    .font(.system(size: 40))
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading, spacing: 5) {
                    Text("Delivery Time")
                    Text("25-30 Min")
                    
                }
            }.padding(.horizontal)
            
            HStack(alignment: .center) {
                Text("$1.99")
                    .fontWeight(.medium)
                    .font(.title)
                    .padding(.horizontal)
                Spacer()
                Text("Temp")
                    .padding(.horizontal)
            }
            
            Image("bg")
                .resizable()
                .frame(width: 350, height: 50, alignment: .center)
                .cornerRadius(15)
                .shadow(color: .gray, radius: 5, x: 5, y: 5)
                .overlay(
                    Text("Add to Cart")
                        .fontWeight(.medium)
                        .font(.system(.title3))
                )
                .padding(.horizontal)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(fruit: .orange)
    }
}
