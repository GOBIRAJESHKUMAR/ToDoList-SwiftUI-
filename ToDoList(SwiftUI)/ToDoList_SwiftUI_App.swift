//
//  ToDoList_SwiftUI_App.swift
//  ToDoList(SwiftUI)
//
//  Created by Rajesh Kumar on 03/09/22.
//

import SwiftUI

@main
struct ToDoList_SwiftUI_App: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
