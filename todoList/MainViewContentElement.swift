//
//  TaskList.swift
//  todoList
//
//  Created by Вадим on 25.09.2023.
//

import SwiftUI

struct MainViewContentElement: View {
    @EnvironmentObject var taskLists: TaskListViewModel
    var list: TaskList
    var body: some View {
        NavigationStack{
            NavigationLink {
                NewList(navigationType: .edit,newTasks: list)
                    .environmentObject(taskLists)
            } label: {
                VStack(alignment: .leading){
                    Text(list.title)
                        .font(.title)
                        .foregroundStyle(.black)
                        .padding([.top, .leading, .trailing])
                    HStack{
                        Text(list.category.rawValue)
                            .foregroundColor(.white)
                            .padding(10)
                            .background{
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.black)
                            }
                            .padding([.bottom, .leading, .trailing])
                        Spacer()
                    }
                }
                .background{
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(Color(list.category.rawValue))
                    
                }
            }
        }
    }
}

#Preview(body: {
    MainViewContentElement(list: TaskList(id: 1, title: "123", pinned: true, category: .finance, listTasks: []))
})
