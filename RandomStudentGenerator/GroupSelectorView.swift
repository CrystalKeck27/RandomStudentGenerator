//
//  ClassSelectorView.swift
//  RandomStudentGenerator
//
//  Created by Tiger Coder on 3/11/21.
//

import SwiftUI

struct GroupSelectorView: View {
    @State public var groups: [Group] = [];
    @State private var editMode = EditMode.inactive
    
    init() {
        GroupsStorage.load();
        update();
    }
    
    func update() {
        groups = GroupsStorage.groups;
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(groups, id: \.id) { group in
                    NavigationLink(destination: ShuffledListView(group: group)){
                        Text(group.name)
                    }
                }
                .onDelete(perform: { indexSet in
                    GroupsStorage.groups.remove(atOffsets: indexSet);
                    GroupsStorage.save();
                    update();
                })
                .onMove(perform: { indices, newOffset in
                    GroupsStorage.groups.move(fromOffsets: indices, toOffset: newOffset);
                    GroupsStorage.save();
                    update();
                })
            }
            .navigationBarTitle("Classes: ")
            .navigationBarItems(leading: EditButton(), trailing: NavigationLink(destination: NewStudentListView()) { Image(systemName: "plus")
            })
            .environment(\.editMode, $editMode)
            .onAppear {
                update()
            }
        }
        
    }
}

struct ClassSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        GroupSelectorView()
    }
}
