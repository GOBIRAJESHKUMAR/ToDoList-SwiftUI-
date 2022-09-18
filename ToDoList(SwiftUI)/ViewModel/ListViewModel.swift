//
//  ListViewModel.swift
//  ToDoList(SwiftUI)
//
//  Created by Rajesh Kumar on 03/09/22.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var lists: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let listKey: String = "Item_List"
    
    init(){
        getList()
    }
    
    
    func getList() {
//        let newList = [
//            ItemModel(name: "Hello", isCompleted: true),
//            ItemModel(name: "cooking", isCompleted: false),
//            ItemModel(name: "washing", isCompleted: true)
//        ]
//        lists.append(contentsOf: newList)
        
        guard
            let data = UserDefaults.standard.data(forKey: listKey),
            let savedList = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        self.lists = savedList
    }
    
    func delete(indexSet: IndexSet) {
        lists.remove(atOffsets: indexSet)
    }
    
    func move(from: IndexSet, to: Int) {
        lists.move(fromOffsets: from, toOffset: to)
    }
    
    func save(title: String) {
        let newList = ItemModel(name: title, isCompleted: false)
        lists.append(newList)
    }
    
    func updateItem(item: ItemModel){
//        if let index = lists.firstIndex(where: { (existingItem) in
//            existingItem.id == item.id
//        }){
//            
//        }
        
        if let index = lists.firstIndex(where: {$0.id == item.id}) {
            lists[index] = item.update()
        }
    }
    
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(lists) {
            UserDefaults.standard.set(encodedData, forKey: listKey)
        }
    }
    
}
