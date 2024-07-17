//
//  ListView.swift
//  TodoList_SwiftUI
//
//  Created by 김한빛 on 7/16/24.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    //이 부분은 데이터와 관련된 부분이기 때문에 ListViewModel로 이동시키고 위 방식으로 데이터 관리 -> 여기서 해줄 필요 없어서 제거 가능
//    @State var items: [ItemModel] = [
//        ItemModel(title: "first item", isCompleted: false),
//        ItemModel(title: "second item", isCompleted: true),
//        ItemModel(title: "third item", isCompleted: false)
//    ]
    
    var body: some View {
        List {
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
        }
        .listStyle(.plain)
        .navigationTitle("🌱 Todo List")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView())
        )
    }
    
    //이 부분도 ListViewModel로 옮겨줘서 삭제 가능
//    func deleteItem(indexSet: IndexSet) {
//        items.remove(atOffsets: indexSet)
//    }
//    
//    func moveItem(from: IndexSet, to: Int) {
//        items.move(fromOffsets: from, toOffset: to)
//    }
}

#Preview {
    NavigationView {
        ListView()
    }
    .accentColor(Color.myGreen4)
    .environmentObject(ListViewModel())
}
