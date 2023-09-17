//
//  TaskModel.swift
//  todoList
//
//  Created by Вадим on 24.08.2023.
//

import Foundation
struct TaskList {
    var title: String
    let pinned: Bool
    var category: TasksType
    var listTasks: [Task]
}

struct Task: Identifiable {
    let id: Int
    var title: String
    var checked: Bool = false
}
