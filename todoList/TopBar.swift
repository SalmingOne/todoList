//
//  TopBar.swift
//  todoList
//
//  Created by Вадим on 22.08.2023.
//

import SwiftUI

struct TopBar: View {
    var typeScreen: Screen
    var dissmisAction: DismissAction?
    @Binding var pinned: Bool
    var body: some View {
        if typeScreen == .main{
            HStack{
                Image("logo")
                Spacer()
                Image("searchImage")
            }
            .padding(.horizontal)
        } else if typeScreen == .other{
            HStack{
                Button {
                    if let dissmisAction{
                        dissmisAction()
                    }
                } label: {
                    Image("backButton")
                }
                Spacer()
                HStack{
                    Image(systemName: "pin")
                    Text(pinned ? "Pinned" : "Pin")
                }
                .padding(10)
                .foregroundColor(pinned ? .white : .black)
                .background{
                    if pinned{
                        RoundedRectangle(cornerRadius: 10)
                        .fill(.black)
                    } else {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke()
                            .foregroundColor(.black)
                    }
                }
                .onTapGesture {
                    withAnimation(.linear(duration: 0.2)) {
                        pinned.toggle()
                    }
                    
                }
            }
            .padding()
        }
    }
}

