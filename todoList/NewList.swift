//
//  NewList.swift
//  todoList
//
//  Created by Вадим on 21.09.2023.
//

import SwiftUI

struct NewList: View {
    @Environment(\.dismiss) var dismissAction
    @EnvironmentObject var taskLists: TaskListViewModel
    
    @State var tasks = TaskViewModel()
    @State var category = TasksType.nothing
    @State var pinned: Bool = false
    @State var listTitle = ""
    @State var taskTitle = ""
    @State var keyboardIsOpened = false
    @State var newTaskTitle = ""
    @State var addTask = false
    @FocusState var addTaskIsActive
    var body: some View {
        NavigationView {
            VStack{
                TextField("Title", text: $listTitle)
                    .font(.title)
                    .padding()
                ScrollView{
                    ForEach($tasks.taskList.indices, id: \.self) { indexTask in
                        HStack{
                            Image(systemName: "square")
                                .padding(.horizontal)
                            TextField("",text: $tasks.taskList[indexTask].title,axis: .vertical)
                                .submitLabel(.done)
                                .padding(.vertical, 10)
                                .onChange(of: tasks.taskList[indexTask].title) { string in
                                    for char in string
                                    {
                                        if char == "\n"
                                        {
                                            UIApplication.shared.endEditing()
                                            if string.replacingOccurrences(of: "\n", with: "").isEmpty{
                                                DispatchQueue.main.async {
                                                    tasks.deleteTask(at: indexTask)
                                                }
                                            } else{
                                                withAnimation {
                                                    tasks.taskList[indexTask].title = string.replacingOccurrences(of: "\n", with: "")
                                                }
                                            }
                                        }
                                        
                                    }
                                    return
                                }
                        }
                    }
                    .onDelete { index in
                        withAnimation {
                            tasks.deleteTask(atOffsets: index)
                        }
                    }
                }
                Spacer()
                if !keyboardIsOpened{
                    withAnimation(){
                        VStack(alignment: .trailing){
                            Button {
                                addTaskIsActive = true
                                withAnimation{
                                    addTask = true
                                    keyboardIsOpened = true
                                }
                            } label: {
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .foregroundColor(.black)
                                    .frame(width: 50,height: 50)
                            }
                            .padding()
                            
                            TaskTypeSelector(type: $category)
                                .padding()
                        }
                    }
                } else if keyboardIsOpened && addTask{
                    HStack{
                        TextField("", text: $newTaskTitle)
                            .textFieldStyle(.roundedBorder)
                            .focused($addTaskIsActive)
                        Spacer()
                        Button {
                            tasks.addTask(title: newTaskTitle)
                            newTaskTitle = ""
                        } label: {
                            Text("Добавить")
                                .foregroundColor(.white)
                                .padding(10)
                                .background{
                                    RoundedRectangle(cornerRadius: 6)
                                        .foregroundColor(.blue)
                                }
                        }
                        
                    }
                    .padding()
                }
                
            }
            .onAppear{
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notification in
                    withAnimation {
                        keyboardIsOpened = true
                    }
                }
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { notification in
                    withAnimation {
                        keyboardIsOpened = false
                    }
                }
            }
            .onDisappear{
                NotificationCenter.default.removeObserver(self)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("backButton")
                        .onTapGesture {
                            dismissAction()
                        }
                }
                ToolbarItem{
                    HStack{
                        Image(systemName: "pin")
                        Text(pinned ? "Pinned" : "Pin")
                    }
                    .onTapGesture {
                        withAnimation{
                            pinned.toggle()
                        }
                    }
                    .padding(10)
                    .foregroundColor(pinned ? .white : .black)
                    .background{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke()
                    }
                }
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

extension UIApplication{
    func endEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
