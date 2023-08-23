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
    var body: some View{
        NavigationView {
            VStack(){
                TopBar(typeScreen: .main)
                    .frame(height: 50)
                    .padding()
                Tabs()
                    .padding()
                Image("background")
                    .padding(.vertical)
                Spacer()
                Text("Create your first to-do list...")
                    .font(.title)
                    .fontWeight(.semibold)
                
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
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
