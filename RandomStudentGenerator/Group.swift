//
//  Group.swift
//  RandomStudentGenerator
//
//  Created by Tiger Coder on 3/11/21.
//

import Foundation

struct Group : Codable {
    var id = UUID();
    var name: String;
    var students: [Student];
}

let sampleGroup = Group(name: "Sample Group",
                        students: [
                            Student(name: "Charlie"),
                            Student(name: "Suzy"),
                            Student(name: "Carl")]);
