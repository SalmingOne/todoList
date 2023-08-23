//
//  TaskTypeSelector.swift
//  todoList
//
//  Created by Вадим on 23.08.2023.
//

import SwiftUI

struct TaskTypeSelector: View {
    var body: some View {
        HStack(spacing: 13.0){
            Text("Personal")
                .foregroundColor(.white)
                .padding(10)
                .background{
                    RoundedRectangle(cornerRadius: 6)
                        .foregroundColor(Color("buttonColor"))
                }
            
            Text("Work")
                .foregroundColor(.white)
                .padding(10)
                .background{
                    RoundedRectangle(cornerRadius: 6)
                        .foregroundColor(Color("buttonColor"))
                }
            Text("Finance")
                .foregroundColor(.white)
                .padding(10)
                .background{
                    RoundedRectangle(cornerRadius: 6)
                        .foregroundColor(Color("buttonColor"))
                }
            Text("Other")
                .foregroundColor(.white)
                .padding(10)
                .background{
                    RoundedRectangle(cornerRadius: 6)
                        .foregroundColor(Color("buttonColor"))
                }
            
        }
    }
}

struct TaskTypeSelector_Previews: PreviewProvider {
    static var previews: some View {
        TaskTypeSelector()
    }
}
