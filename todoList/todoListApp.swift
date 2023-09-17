//
//  todoListApp.swift
//  todoList
//
//  Created by Вадим on 22.08.2023.
//

import SwiftUI

@main
struct todoListApp: App {
    @StateObject var taskLists = TaskListViewModel()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(taskLists)
        }
    }
}
