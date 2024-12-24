//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Cihan Yilmaz on 12/22/24.
//

import Foundation

class NewItemViewViewModel : ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init () {
        
    }
    
    func save() {
        
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
    }
}
