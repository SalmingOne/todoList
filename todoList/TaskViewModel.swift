//
//  TaskViewModel.swift
//  todoList
//
//  Created by Вадим on 24.08.2023.
//

import SwiftUI

class TaskViewModel: ObservableObject{
    @Published var count = 0
    @Published var taskList: [Task] = []
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
    @Published var isEmpty: Bool  = true
    var currentTask: Int = 0
    func addTaskList(title: String, category: TasksType, isPinned: Bool, tasks: [Task]) {
        taskLists.append(TaskList(id:Int.random(in: 0...10000000) ,title: title, pinned: isPinned, category: category, listTasks: tasks))
        isEmpty = false
    }
    func changeTaskList(id: Int, title: String, category: TasksType, isPinned: Bool, listTasks: [Task]) {
        print(taskLists)
        if let index = taskLists.firstIndex(where: { $0.id == id }) {
            taskLists[index].title = title
            taskLists[index].category = category
            taskLists[index].pinned = isPinned
            taskLists[index].listTasks = listTasks
        }
        print(taskLists)
    }
}
