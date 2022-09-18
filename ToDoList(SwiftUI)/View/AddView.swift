//
//  AddView.swift
//  ToDoList(SwiftUI)
//
//  Created by Rajesh Kumar on 03/09/22.
//

import SwiftUI

struct AddView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var titleTextField: String = ""
    @State private var alertTitle: String = ""
    @State private var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading ,spacing: 30) {
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Cancel")
                        .font(.title3)
                        .foregroundColor(.red)
                })
                .padding(5)
                .padding(.horizontal, 10)
                
                TextField("ToDo", text: $titleTextField)
                    .font(.headline)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                
                Button {
                    saveButtonPressed()
                } label: {
                    Text("Save")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .padding(.vertical, 5)
                        .background(Color.blue)
                        .cornerRadius(10)
                }

            }
            .padding()
        }
        .alert("\(alertTitle)", isPresented: $showAlert) {
            Text("Add 4 Letters")
        }
    }
    
    func saveButtonPressed() {
        
        guard textIsAppropriate() else {
            showAlert.toggle()
            return
        }
        listViewModel.save(title: titleTextField)
        presentationMode.wrappedValue.dismiss()
        }
    
    func textIsAppropriate() -> Bool {
        if titleTextField.count < 4 {
            alertTitle = "your todo list need atleat 4 letters!!!😢🤧"
            return false
        }
        return true
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
            AddView()
    }
}
