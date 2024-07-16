//
//  TodoList_SwiftUIApp.swift
//  TodoList_SwiftUI
//
//  Created by 김한빛 on 7/16/24.
//

import SwiftUI

@main
struct TodoList_SwiftUIApp: App {
    init() {
        // 네비게이션바 아이템 틴트색상 설정
        UINavigationBar.appearance().tintColor = UIColor(named: "myGreen4")
    }
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .accentColor(Color.myGreen4)
        }
    }
}
