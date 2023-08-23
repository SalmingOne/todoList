//
//  Tab.swift
//  todoList
//
//  Created by Вадим on 23.08.2023.
//

import SwiftUI

struct Tab: View {
    let nameTab: String
    let tabType: Tabs.TabsType
    @Binding var selectedTab: Tabs.TabsType
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 200.0, height: 50.0)
            .foregroundColor(tabType == selectedTab ? .black : Color("selectTabColor"))
            .onTapGesture {
                withAnimation {
                    selectedTab = tabType
                }
            }
            .overlay(
                Text(nameTab)
                    .foregroundColor(tabType == selectedTab ? .white : .black)
                    .opacity(tabType == selectedTab ? 1 : 0.4)
            )
    }
}
