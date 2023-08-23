//
//  NewList.swift
//  todoList
//
//  Created by Вадим on 23.08.2023.
//

import SwiftUI

struct NewList: View {
    @Environment(\.dismiss) var dismissAction
    var body: some View {
        NavigationView {
            VStack{
                TopBar(typeScreen: .other,dissmisAction: dismissAction)
                Spacer()
                TaskTypeSelector()
                    .padding()
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct NewList_Previews: PreviewProvider {
    static var previews: some View {
        NewList()
    }
}
