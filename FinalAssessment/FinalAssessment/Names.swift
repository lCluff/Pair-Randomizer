//
//  Names.swift
//  FinalAssessment
//
//  Created by Leah Cluff on 7/19/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

import Foundation

class Names: Equatable, Codable {
    
    var name: String
    init(name: String) {
        self.name = name
    }
    
    static func == (lhs: Names, rhs: Names) -> Bool {
        if lhs.name == rhs.name {
            return true
        } else {
            return false
        }
    }
}
