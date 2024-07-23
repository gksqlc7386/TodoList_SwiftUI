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
    
    @Published var items: [ItemModel] = [] {
        //saveItems 함수를 각 함수에 즉, 추가, 수정, 업데이트할 때마다 넣어주는 것을 비효율적이기 때문에 변화에 따라서 함수가 실행되도록
        didSet {
            saveItems()
        }
    }
    
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        //임시 데이터 불러오기
//        let newItems = [
//            ItemModel(title: "first item", isCompleted: false),
//            ItemModel(title: "second item", isCompleted: true),
//            ItemModel(title: "third item", isCompleted: false)
//        ]
//        items.append(contentsOf: newItems)
        
        //UserDefaults에서 데이터 불러오기
//        let data = UserDefaults.standard.data(forKey: itemsKey)
        
        //UserDefault가 비어있을 경우를 대비해서 guard let으로 선언
        guard 
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItems
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
    
    func saveItems() { //UserDefault를 사용해서 plist에 저장
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
