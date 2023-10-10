//
//  TaskModel.swift
//  todoList
//
//  Created by Вадим on 24.08.2023.
//

import Foundation
struct TaskList: Identifiable, Hashable {
    var id: Int
    var title: String
    var pinned: Bool
    var category: TasksType
    var listTasks: [Task]
}

struct Task: Identifiable, Hashable {
    let id: Int
    var title: String
    var checked: Bool = false
}
