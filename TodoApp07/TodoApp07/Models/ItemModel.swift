//
//  File.swift
//  TodoApp07
//
//  Created by KJ on 1/3/23.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    let title: String
    let isCompleted: Bool
    let id: String
    
    init(Id: String = UUID().uuidString, Title: String, IsCompleted: Bool) {
        self.id = Id
        self.title = Title
        self.isCompleted = IsCompleted
    }
    
    func updateCompleted() -> ItemModel {
        return ItemModel(Id: self.id, Title: self.title, IsCompleted: !self.isCompleted)
    }
}
