//
//  ItemModel.swift
//  ToDoList(SwiftUI)
//
//  Created by Rajesh Kumar on 03/09/22.
//

import Foundation
import SwiftUI


struct ItemModel: Identifiable, Codable {
    
    var id: String
    var name: String
    var isCompleted: Bool
    
    
    init(id: String = UUID().uuidString, name: String, isCompleted: Bool){
        self.id = id
        self.name = name
        self.isCompleted = isCompleted
    }
    
    func update() -> ItemModel {
        return ItemModel(id: id, name: name, isCompleted: !isCompleted)
    }
    
}




