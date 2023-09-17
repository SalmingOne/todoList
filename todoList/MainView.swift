//
//  ContentView.swift
//  todoList
//
//  Created by Вадим on 22.08.2023.
//

import SwiftUI
enum Screen {
    case main
    case other
}

struct MainView: View {
    @EnvironmentObject var taskLists: TaskListViewModel
    var body: some View{
        NavigationStack {
            VStack{
                Tabs()
                    .padding()
                NavigationLink {
                    NewList()
                } label: {
                    Text("+ New List")
                        .padding()
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
                .background {
                    Color.black
                }
                .cornerRadius(10)
                .padding()
                Spacer()
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("logo")
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image("searchImage")
                        .padding()
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
