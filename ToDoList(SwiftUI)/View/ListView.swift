//
//  ListView.swift
//  ToDoList(SwiftUI)
//
//  Created by Rajesh Kumar on 03/09/22.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State private var isAddPressed: Bool = false
    
    var body: some View {
        
        ZStack{
            
            if listViewModel.lists.isEmpty {
                EmptyListView()
            } else {
                List {
                    ForEach(listViewModel.lists, id: \.id) { list in
                        ListRowView(item: list)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: list)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.delete)
                    .onMove(perform: listViewModel.move)
                }
                .listStyle(.insetGrouped)
            }
            
        }
        .navigationTitle("ToDo List 📝")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                
                if listViewModel.lists.isEmpty {
                    EditButton().hidden()
                } else {
                    EditButton()
                }
                
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isAddPressed.toggle()
                } label: {
                    Text("Add")
                        .fontWeight(.medium)
                        .foregroundColor(.blue)
                }
            }
        }
        
        .sheet(isPresented: $isAddPressed) {
            AddView()
        }
    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}
