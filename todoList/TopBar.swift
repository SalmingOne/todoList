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
                Button {
                    
                } label: {
                    HStack{
                        Image("pin")
                            .aspectRatio(contentMode: .fit)
                            .scaleEffect(1.5)
                        Text("Pin")
                    }
                    .padding(10)
                    .background{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke()
                    }
                    .foregroundColor(.black)
                }
            }
            .padding()
        }
    }
}

struct TopBar_Previews: PreviewProvider {
    static var previews: some View {
        TopBar(typeScreen: .other)
    }
}
