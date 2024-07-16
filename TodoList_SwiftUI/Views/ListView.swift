//
//  ListView.swift
//  TodoList_SwiftUI
//
//  Created by 김한빛 on 7/16/24.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [
        ItemModel(title: "first item", isCompleted: false),
        ItemModel(title: "second item", isCompleted: true),
        ItemModel(title: "third item", isCompleted: false)
    ]
    
    var body: some View {
        List {
            ForEach(items) { item in
                ListRowView(item: item)
            }
        }
        .listStyle(.plain)
        .navigationTitle("🌱 Todo List")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView())
        )
    }
}

#Preview {
    NavigationView {
        ListView()
    }
    .accentColor(Color.myGreen4)
}
