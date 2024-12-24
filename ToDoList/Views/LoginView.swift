//
//  LoginView.swift
//  ToDoList
//
//  Created by Cihan Yilmaz on 12/22/24.
//

import SwiftUI

struct LoginView: View {
    
   @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        NavigationView {
            VStack {
                // Header arguments
                HeaderView(title: "To Do List", subtitle: "Get things done", angle: 15, background: .pink)
                
                // Login Form
                Form {
                    // Error message
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    // Button arguments
                    TLButton(title: "Log in", background: .blue) {
                        // Attempt log in
                        viewModel.login()
                    }
                }
                .offset(y: -50)
                
                
                
                
                // Create Account
                VStack {
                    Text("New around here?")
                    NavigationLink("Create An Account", destination: RegisterView())
                }
                .padding(.bottom,50)
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
