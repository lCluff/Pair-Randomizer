//
//  NamesController.swift
//  FinalAssessment
//
//  Created by Leah Cluff on 7/19/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

import Foundation

class NamesController {
    
    static let sharedInstance = NamesController()
    
    var names: [Names] = []
    var groupedNames: [[Names]] = []


    func create() {
        
    }
    
    func delete() {
        
    }

    //MARK: - grouping and shuffling
    func shuffleNames() {
        
    }
    
    func groupNames() {
        
    }
    func ungroupNames() {
        
    }
    
    func fileURL() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        let fileName = "names.json"
        let fullURL = documentsDirectory.appendingPathComponent(fileName)
        
        print(fullURL)
        
        return(fullURL)
    }
    
    func saveToPersistentStore() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(self.names)
            try data.write(to: fileURL())
        } catch {
            print("Error: \(#function): \(error) : \(error.localizedDescription)")
        }
    }
    
    func loadFromPersistenceStore() -> [Names] {
        do {
            let data = try Data(contentsOf: fileURL())
            let decoder = JSONDecoder()
            let names = try decoder.decode([Names].self, from: data)
            return names
        } catch  {
            print("Error: \(#function): \(error) : \(error.localizedDescription)")
        }
        
        return []
    }
}    

extension Array {
    func pairedNames(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map { Array(self[$0 ..< Swift.min($0 + size, count)]) }
    }
}
