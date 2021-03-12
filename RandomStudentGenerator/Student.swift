//
//  Student.swift
//  RandomStudentGenerator
//
//  Created by Tiger Coder on 3/11/21.
//

import Foundation

struct Student: Identifiable, Codable {
    var id = UUID();
    var name: String;
}
