//
//  NoListView.swift
//  TodoApp07
//
//  Created by KJ on 1/3/23.
//

import SwiftUI

struct NoListView: View {
    
    @State var animate: Bool = false
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(Animation
                .easeInOut(duration: 2.0)
                .repeatForever()
            ){
                animate.toggle()
            }
        }
    }
    
    var body: some View {
        ScrollView(){
            VStack(spacing: 20){
                Text("There are no items !!")
                    .font(.title)
                    .bold()
                Text("Be more productive and add some todos to finish them on time!!")
                    .padding(.bottom, 20)
                NavigationLink(destination: AddView(), label: {
                    Text("Add todo now 😃")
                        .foregroundColor(animate ? .yellow : .black)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color(.systemBlue) : Color(.yellow))
                        .cornerRadius(20)
                }).padding(.horizontal, animate ? 30 : 50)
                    .shadow(color: .gray, radius: 5, x: 5, y: 5)
                
            }.multilineTextAlignment(.center)
                .padding(40)
                .onAppear(perform: addAnimation)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct NoListView_Previews: PreviewProvider {
    static var previews: some View {
        NoListView()
    }
}
