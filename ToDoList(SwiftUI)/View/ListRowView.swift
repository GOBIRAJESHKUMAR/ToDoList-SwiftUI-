//
//  ListRowView.swift
//  ToDoList(SwiftUI)
//
//  Created by Rajesh Kumar on 03/09/22.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "flag.circle.fill")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.name)
            Spacer()
        }
        .font(.title2)
        .padding(5)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(name: "movie", isCompleted: true)
    static var item2 = ItemModel(name: "cooking", isCompleted: false)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
