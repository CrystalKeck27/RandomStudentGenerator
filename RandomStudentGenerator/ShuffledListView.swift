//
//  ShuffledListView.swift
//  RandomStudentGenerator
//
//  Created by Tiger Coder on 3/11/21.
//

import SwiftUI

struct ShuffledListView: View {
    @State public var group: Group;
    @State private var currentIndex = 0;
    
    var body: some View {
        VStack {
            List {
                ForEach(0 ..< group.students.count) { index in
                    let student = group.students[index];
                    VStack {
                        Text(student.name)
                    }.listRowBackground(currentIndex == index ? Color.blue : Color.white)
                }
            }
            HStack{
                Button(action: {
                    group.students.shuffle();
                }) {
                    Text("Shuffle")
                }.frame(maxWidth: .infinity)
                
                Button(action: {
                    currentIndex -= currentIndex > 0 ? 1 : 0;
                }) {
                    Text("Previous")
                }.frame(maxWidth: .infinity)
                
                Button(action: {
                    currentIndex += currentIndex < group.students.count - 1 ? 1 : 0;
                }) {
                    Text("Next")
                }.frame(maxWidth: .infinity)
            }
        }.navigationBarTitle(group.name)
    }
}

struct ShuffledListView_Previews: PreviewProvider {
    static var previews: some View {
        ShuffledListView(group: sampleGroup)
    }
}
