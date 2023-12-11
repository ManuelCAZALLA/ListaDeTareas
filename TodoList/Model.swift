//
//  Model.swift
//  TodoList
//
//  Created by Manuel Cazalla Colmenero on 11/12/23.
//

import Foundation

struct NoteModel: Codable {
    let id : String
    var isFavorite: Bool
    let description: String
    
    init(id: String = UUID().uuidString, isFavorite: Bool = false, description: String) {
        self.id = id
        self.isFavorite = isFavorite
        self.description = description
    }
}
