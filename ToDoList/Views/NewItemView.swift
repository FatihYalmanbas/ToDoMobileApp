//
//  NewItemView.swift
//  ToDoList
//
//  Created by Cihan Yilmaz on 12/22/24.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding()
            
            Form {
                // Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                // Due Date
                DatePicker("Due date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                   
                // Button
               
                
                //.padding(.bottom, 100)
                //.offset(y:50)
                
               
                
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"), message: Text("Please fill in all fields and select due date that is today or newer."))
                      }
            
            TLButton(title: "Save", background: .pink) {
                if viewModel.canSave {
                    viewModel.save()
                    newItemPresented = false
                } else {
                    viewModel.showAlert = true
                }
            }
            .buttonStyle(.plain)
            .frame(width: 300, height: 80)
            
            
        }
        
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
            return true
        }, set: {_ in
            
        }))
    }
}
