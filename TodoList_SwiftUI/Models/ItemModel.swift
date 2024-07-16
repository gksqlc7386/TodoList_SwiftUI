//
//  ItemModel.swift
//  TodoList_SwiftUI
//
//  Created by 김한빛 on 7/17/24.
//

import Foundation

struct ItemModel : Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
