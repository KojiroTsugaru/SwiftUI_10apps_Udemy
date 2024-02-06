//
//  ListViewModel.swift
//  TodoApp07
//
//  Created by KJ on 1/3/23.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet{
            saveItems()
        }
    }
    
    let itemsKey: String = "items_list"
    
    init(){
        getItems()
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(Title: title, IsCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }){
            items[index] = item.updateCompleted()
        }
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItems(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    
    func getItems(){
        guard let data = UserDefaults.standard.data(forKey: itemsKey) else {
            return
        }
        
        if let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data){
            self.items = savedItems
        }
    }
    
    func saveItems() {
        if let encodeItem = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodeItem, forKey: itemsKey)
        }
    }
}
