//
//  ListRowView.swift
//  TodoList_SwiftUI
//
//  Created by 김한빛 on 7/16/24.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            //HStack 우클릭 -> Extract Subview -> 새로운 struct로 자동 생성
            //이렇게 만든 struct를 따로 파일로 분리해서 잘라서 코드 분리 -> 코드 깔끔, 유지보수 용이
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? Color.myGreen4 : Color.myGreen)
            Text(item.title)
            Spacer()
        }
        .font(.title3)
        .padding(.vertical, 4) // 세로축에 여백 추가
    }
}

#Preview {
    let item1 = ItemModel(title: "First item!", isCompleted: false)
    let item2 = ItemModel(title: "Second Item.", isCompleted: true)

    return Group {
        ListRowView(item: item1)
        ListRowView(item: item2)
    }
    .previewLayout(.sizeThatFits)
}
