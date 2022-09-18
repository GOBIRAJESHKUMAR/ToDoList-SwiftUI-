//
//  EmptyListView.swift
//  ToDoList(SwiftUI)
//
//  Created by Rajesh Kumar on 03/09/22.
//

import SwiftUI

struct EmptyListView: View {
    
    @State var isAnimating: Bool = false
    
    @State var addSomethingPressed: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Spacer()
                Text("Oop's there are no item's!")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding()
                
                Text("Let's get started by adding new todo lists, to be productive")
                    .padding(.bottom, 20)
                
                Button {
                    addSomethingPressed.toggle()
                } label: {
                    Text("Add Something 🥳")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .frame(height: 60)
                        .frame(maxWidth: .infinity)
                        .background(
                            isAnimating ? Color.blue : Color.red
                        )
                        .cornerRadius(10)
                }
                .padding(.horizontal, isAnimating ? 30 : 50)
                .shadow(color: isAnimating ? Color.blue.opacity(0.8) : Color.red.opacity(0.8),
                        radius: isAnimating ? 30 : 10,
                        x: 0,
                        y: isAnimating ? 50 : 30)
                .scaleEffect(isAnimating ? 1.1 : 1)
                .offset(y: isAnimating ? -8 : 0)

            }
            .multilineTextAlignment(.center)
            .padding()
            .onAppear(perform: animation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .sheet(isPresented: $addSomethingPressed) {
            AddView()
        }
    }
    
    func animation() {
        guard !isAnimating else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(
                .easeInOut(duration: 2)
                .repeatForever()
            ) {
                isAnimating.toggle()
            }
        }
        
    }
    
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EmptyListView()
        }
    }
}
