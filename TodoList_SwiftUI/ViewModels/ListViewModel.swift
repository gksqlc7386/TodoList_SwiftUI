//
//  ListViewModel.swift
//  TodoList_SwiftUI
//
//  Created by 김한빛 on 7/17/24.
//

import Foundation
import SwiftUI

/*

 CRUD Functions
  - Create : addItem()
  - Read : getItems()
  - Update : updateItem()
  - Delete : deleteItem()
 
*/

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            ItemModel(title: "first item", isCompleted: false),
            ItemModel(title: "second item", isCompleted: true),
            ItemModel(title: "third item", isCompleted: false)
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
//        if let index = items.firstIndex { (exsistingItem) -> Bool in
//            return exsistingItem.id == item.id
//        } {
//            //run this code
//        }
        
        //위에 내용과 동일하지만 더 간결
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items[index] = item.updateCompletion() 
        }
    }
}
