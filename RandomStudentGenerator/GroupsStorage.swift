//
//  GroupsStorage.swift
//  RandomStudentGenerator
//
//  Created by Tiger Coder on 3/11/21.
//

import Foundation

class GroupsStorage {
    public static var groups: [RandomStudentGenerator.Group] = []
    
    public static func load() {
        print("Loading Groups... ");

        if let data = UserDefaults.standard.data(forKey: "Groups") {
            print("Inside if/let")
            do {
                let decoder = JSONDecoder();
                groups = try decoder.decode([Group].self, from: data);
                print(groups)
            } catch {
                print("Unable to Decode Groups (\(error))")
            }
        }
    }
    
    public static func save() {
        do {
            let encoder = JSONEncoder();
            let data = try encoder.encode(groups);
            UserDefaults.standard.set(data, forKey: "Groups");
        } catch {
            print("Unable to Encode Note (\(error))")
        }
    }
}
