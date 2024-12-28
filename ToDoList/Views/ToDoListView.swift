//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Cihan Yilmaz on 12/22/24.
//

import SwiftUI
import FirebaseFirestoreSwift
struct ToDoListView: View {
    @StateObject var viewModel : ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
   
    init (userId : String) {
        // users/<id>/todos/<entries>
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
        
    }
    var body: some View {
        NavigationView {
            VStack {
                List(items) {
                    item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button ("Delete") {
                                //Delete
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                               
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .offset(y:10)
           
            
            // Add button added
            .toolbar {
                Button {
                    // Action
                    viewModel.showingNewItemView = true
                }
                label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "7DNz8thnoRYqo4oAcjo2CJt0Jeg1")
    }
}
