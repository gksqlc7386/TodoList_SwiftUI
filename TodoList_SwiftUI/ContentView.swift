//
//  ContentView.swift
//  TodoList_SwiftUI
//
//  Created by 김한빛 on 7/16/24.
//

import SwiftUI

/*
MVVM
 Model - data point
 View - UI
 ViewModel - manages Models for View (뷰에 대한 모델 또는 데이터를 관리)
 
*/

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
