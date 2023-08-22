//
//  TopBar.swift
//  todoList
//
//  Created by Вадим on 22.08.2023.
//

import SwiftUI

struct TopBar: View {
    var body: some View {
        HStack{
            Image("logo")
            Spacer()
            Image("searchImage")
        }
        .padding(.horizontal)
    }
}

struct TopBar_Previews: PreviewProvider {
    static var previews: some View {
        TopBar()
    }
}
