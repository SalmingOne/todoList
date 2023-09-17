//
//  TaskViewModel.swift
//  todoList
//
//  Created by Вадим on 24.08.2023.
//

import SwiftUI

class TaskViewModel: ObservableObject{
    @Published var taskList: [Task] = [
        Task(id: 1, title: "12"),
        Task(id: 2, title: "1fsd2"),
        Task(id: 3, title: "12sdf"),
        Task(id: 4, title: "12sdf"),
        Task(id: 5, title: "1sf2"),
    ]
    func addTask(title: String) {
        taskList.append(Task(id: Int.random(in: 0...10000000), title: title))
    }
    func deleteTask(at index: Int) {
        taskList.remove(at: index)
    }
    func deleteTask(atOffsets index: IndexSet) {
        taskList.remove(atOffsets: index)
    }
    
}

class TaskListViewModel: ObservableObject {
    @Published var taskLists: [TaskList] = []
    
    
    func addTaskList(title: String, category: TasksType, isPinned: Bool, tasks: [Task]) {
        taskLists.append(TaskList(title: title, pinned: isPinned, category: category, listTasks: tasks))
    }
}
