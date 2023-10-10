//
//  Tabs.swift
//  todoList
//
//  Created by Вадим on 22.08.2023.
//

import SwiftUI



struct Tabs: View {
    enum TabsType {
        case allLists, pinned
    }
    @State var selectedTab = TabsType.allLists
    @EnvironmentObject var taskLists: TaskListViewModel
    var isEmpty = true
    var body: some View {
        VStack()
        {
            HStack(spacing: -50.0){
                Tab(nameTab: "All Lists", tabType: .allLists, selectedTab: $selectedTab)
                    .zIndex(selectedTab == .allLists ? 1 : 0)
                Tab(nameTab: "Pinned", tabType: .pinned, selectedTab: $selectedTab)
                    .zIndex(selectedTab == .pinned ? 1 : 0)
            }
            .padding(.vertical)
            .animation(.linear, value: selectedTab)
            if taskLists.taskLists.isEmpty{
                if selectedTab == .allLists{
                    Image("background")
                        .padding(.vertical)
                    Spacer()
                    Text("Create your first to-do list...")
                        .font(.title)
                        .fontWeight(.semibold)
                } else {
                    Image("background2")
                        .padding(.vertical)
                    Spacer()
                    Text("Ooops! No pinned list yet...")
                        .font(.title)
                        .fontWeight(.semibold)
                }
            } else {
                ScrollView{
                    ForEach(taskLists.taskLists){ list in
                        if selectedTab == .allLists{
                            MainViewContentElement(list: list)
                                .environmentObject(taskLists)
                        }
                        else if selectedTab == .pinned{
                            if list.pinned == true{
                                MainViewContentElement(list: list)
                                    .environmentObject(taskLists)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview(body: {
    Tabs()
        .environmentObject(TaskListViewModel())
})
        

