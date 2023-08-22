//
//  ContentView.swift
//  todoList
//
//  Created by Вадим on 22.08.2023.
//

import SwiftUI

struct MainView: View {
    var body: some View{
        VStack(){
            TopBar()
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
            Button {
                print(1)
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 200.0, height: 50.0)
                        .foregroundColor(.black)
                    Text("+ New List")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
            }
            .padding()

            Spacer()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
