//
//  TaskTypeSelector.swift
//  todoList
//
//  Created by Вадим on 23.08.2023.
//

import SwiftUI
enum TasksType: String{
    case personal = "Personal"
    case work = "Work"
    case finance = "Finance"
    case other, nothing = "Other"
}

struct TaskTypeSelector: View {
    @Binding var type: TasksType
    var body: some View {
        HStack(spacing: 13.0){
            TaskType(title: "Personal", taskType: .personal, selectedType: $type)
            TaskType(title: "Work", taskType: .work, selectedType: $type)
            TaskType(title: "Finance", taskType: .finance, selectedType: $type)
            TaskType(title: "Other", taskType: .other, selectedType: $type)

        }
    }
}

