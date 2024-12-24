//
//  User.swift
//  ToDoList
//
//  Created by Cihan Yilmaz on 12/22/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
