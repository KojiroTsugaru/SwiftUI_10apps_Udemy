//
//  InvitationView.swift
//  linkedinUIClone06
//
//  Created by KJ on 12/31/22.
//

import SwiftUI

let sampleData = NetworkModel(id: 1, name: "James Harden", position: "SDE at Paytm", mutual: 12, image: "01")

struct InvitationView: View {
    
    var Data: NetworkModel
    
    var body: some View {
            HStack (alignment: .center){
                Spacer()
                Image(Data.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(width: 70, height: 85, alignment: .leading)
                VStack(alignment: .leading){
                    Text(Data.name)
                        .font(.body)
                    Text(Data.position)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    HStack {
                        Image(systemName: "link")
                        Text("\(Data.mutual) mutual connections")
                            .multilineTextAlignment(.leading)
                            .lineLimit(1)
                    }
                    .foregroundColor(.gray)
                    .font(.system(size: 15, weight: .light))
                }.frame(width: 150, height: 20)
                HStack {
                    Image(systemName: "multiply.circle")
                        .foregroundColor(.gray)
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(.blue).opacity(0.8)
                }
                .font(.system(size: 35))
                .padding(.horizontal)
            }
            .frame(width: .infinity, height: .infinity)
            .padding(.horizontal)
    }
}

struct InvitationView_Previews: PreviewProvider {
    static var previews: some View {
        InvitationView(Data: sampleData)
    }
}
