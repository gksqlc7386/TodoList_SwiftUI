//
//  AddView.swift
//  TodoList_SwiftUI
//
//  Created by 김한빛 on 7/16/24.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type someting here...", text: $textFieldText) //TextField 우클릭해서 Embed in VStack 누르면 자동으로 스택에 넣어줌
                    .padding(.horizontal) //양 옆에 여백 주기
                    .frame(height: 50)
                    .background(Color.myWhite)
                    .cornerRadius(10)
                
                Button(
                    action: tappedSaveButton,
                    label: {
                        Text("Save".uppercased())
                            .foregroundStyle(Color.white)
                            .font(.headline)
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .background(Color.myGreen4)
                            .cornerRadius(10)
                    })
            }
            .padding(14) //스택 양 옆 위 아래 여백주기
        }
        .navigationTitle("Add 🌿")
    }
    
    func tappedSaveButton() {
        listViewModel.addItem(title: textFieldText)
        presentationMode.wrappedValue.dismiss()
    }
}

#Preview {
    NavigationView {
        AddView()
    }
    .environmentObject(ListViewModel())
}
