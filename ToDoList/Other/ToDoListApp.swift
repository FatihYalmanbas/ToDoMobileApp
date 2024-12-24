//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Cihan Yilmaz on 12/22/24.
//

import FirebaseCore
import SwiftUI


struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
