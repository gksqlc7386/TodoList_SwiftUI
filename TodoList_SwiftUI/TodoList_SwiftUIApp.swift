//
//  TodoList_SwiftUIApp.swift
//  TodoList_SwiftUI
//
//  Created by 김한빛 on 7/16/24.
//

import SwiftUI

@main
struct TodoList_SwiftUIApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .accentColor(Color.myGreen4)
            .environmentObject (listViewModel)
        }
    }
}
