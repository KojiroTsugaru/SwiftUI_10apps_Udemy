//
//  ListView.swift
//  TodoApp07
//
//  Created by KJ on 1/4/23.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var list: ListViewModel
    var body: some View {
        ZStack{
            if list.items.isEmpty {
                NoListView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            }
            else{
                List{
                    ForEach(list.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    list.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: list.deleteItem(indexSet:))
                    .onMove(perform: list.moveItems(from:to:))
                }
            }
        }
        .navigationTitle("Todo List📚")
        .navigationBarItems(leading: EditButton(), trailing: NavigationLink(destination: AddView(), label: {
            Text("Add")
        }))
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }.environmentObject(ListViewModel())
    }
}
