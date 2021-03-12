//
//  ShuffledListView.swift
//  RandomStudentGenerator
//
//  Created by Tiger Coder on 3/11/21.
//

import SwiftUI

struct ShuffledListView: View {
    @State public var students: Array<Student>;
    @State private var currentIndex = 0;
    
    var body: some View {
        VStack {
            List {
                ForEach(0 ..< students.count) { index in
                    let student = students[index];
                    VStack {
                        Text(student.name)
                    }.listRowBackground(currentIndex == index ? Color.blue : Color.white)
                }
            }
            HStack{
                Button(action: {
                    students.shuffle();
                }) {
                    Text("Shuffle")
                }.frame(maxWidth: .infinity)
                
                Button(action: {
                    currentIndex -= currentIndex > 0 ? 1 : 0;
                }) {
                    Text("Previous")
                }.frame(maxWidth: .infinity)
                
                Button(action: {
                    currentIndex += currentIndex < students.count - 1 ? 1 : 0;
                }) {
                    Text("Next")
                }.frame(maxWidth: .infinity)
            }
        }
    }
}

struct ShuffledListView_Previews: PreviewProvider {
    static var previews: some View {
        ShuffledListView(students: sampleGroup.students)
    }
}
