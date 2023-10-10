//
//  ContentView.swift
//  todoList
//
//  Created by Вадим on 22.08.2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var taskLists = TaskListViewModel()
    var isEmpty = false
    var body: some View{
        NavigationStack {
            VStack(alignment: .center){
                Tabs()
                    .environmentObject(taskLists)
                    .padding()
                NavigationLink {
                    NewList(navigationType: .add)
                        .environmentObject(taskLists)
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 70,height: 70)
                }
                .cornerRadius(10)
                .padding()
                Spacer()
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("logo")
                }
            }
        }
    }
}


#Preview{
    MainView()
}
