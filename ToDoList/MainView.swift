//
//  ContentView.swift
//  ToDoList
//
//  Created by Cihan Yilmaz on 12/22/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var  viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
            
        }
        else
        {
            LoginView()
        }
    }
    @ViewBuilder
    var accountView: some View {
        
        // Home & Profile tabs at the bottom of the screen
        TabView {
            // Signed In
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

