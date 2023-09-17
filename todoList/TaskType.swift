//
//  TaskType.swift
//  todoList
//
//  Created by Вадим on 24.08.2023.
//

import SwiftUI

struct TaskType: View {
    let title: String
    let taskType: TasksType
    @Binding var selectedType: TasksType
    var body: some View {
        Text(title)
            .foregroundColor(.white)
            .padding(10)
            .background{
                RoundedRectangle(cornerRadius: 6)
                    .foregroundColor(taskType == selectedType ? .black :  Color("buttonColor"))
            }
            .onTapGesture {
                withAnimation {
                    if taskType == selectedType{
                        selectedType = .nothing
                    } else {
                        selectedType = taskType
                    }
                }
                
            }
    }
}
