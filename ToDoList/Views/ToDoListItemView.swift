//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Cihan Yilmaz on 12/22/24.
//

import SwiftUI

struct ToDoListItemView: View {
    
    let item: ToDoListItem
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                    .padding(1)
                    
                    
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
                    .padding(1)
                    
            }
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item:item)
            }
        label: {
            Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                .foregroundColor(Color.blue)
        }
        }
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(item: .init(
            id: "123",
            title: "Get milk",
            dueDate: Date().timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        ))
    }
}
