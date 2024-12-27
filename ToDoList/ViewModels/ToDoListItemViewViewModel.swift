//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Cihan Yilmaz on 12/22/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

// View model for (Single) To Do list Item view
// Secondary tab
class ToDoListItemViewViewModel : ObservableObject {
    
    /*
    private let userId: String
    init (userId: String) {
        self.userId = userId
    }*/
    init() {
        
    }
    func toggleIsDone(item:ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
