//
//  ProfileView.swift
//  ToDoList
//
//  Created by Cihan Yilmaz on 12/22/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading profile...")
                }
                
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUsers()
        }
    }
    @ViewBuilder
    func profile(user:User) -> some View {
        // Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125, height: 125)
            .padding()
        // Info: Name, Email, Member since
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ")
                Text(user.name)
            }
            .padding()
            HStack {
                Text("Email: ")
                Text(user.email)
            }
            .padding()
            HStack {
                Text("Member since: ")
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
        .padding()
        // Sign out
        Button("Log out") {
            viewModel.logOut()
        }
        .tint(.red)
        .padding()
        
       
        Spacer()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
