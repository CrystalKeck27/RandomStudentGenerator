//
//  ContentView.swift
//  RandomStudentGenerator
//
//  Created by Tiger Coder on 3/11/21.
//

import SwiftUI

struct NewStudentListView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var username = "";
    @State private var listName = "";
    @State private var selectedStudentIndex = "";
    @State private var students: [Student] = [];
    
    var body: some View {
        VStack {
            Text("Enter list name below.")
                .multilineTextAlignment(.center)
            TextField(
                "List Name",
                text: $listName
            ).padding(.horizontal)
            Text("Enter a student's name to add it to the list.\nSwipe left on a student's name to delete it.")
                .multilineTextAlignment(.center)
                .padding(.top)
            TextField(
                "Student Name",
                text: $username
            ) {_ in } onCommit: {
                self.addName(name: username)
            } .padding(.horizontal)
            List {
                ForEach(students, id: \.id) { student in
                    Text(student.name)
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        students.remove(at: index)
                    }
                }
            }
            Button(action: {
                print("aofnof");
                print(students);
                GroupsStorage.groups.append(Group(name: listName, students: students));
                GroupsStorage.save();
                
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Done")
            }
        }
    }
    
    private func addName(name: String) {
        print(username);
        students.insert(Student(name: name), at: 0);
        username = "";
    }
}

struct NewStudentListView_Previews: PreviewProvider {
    static var previews: some View {
        NewStudentListView()
    }
}
