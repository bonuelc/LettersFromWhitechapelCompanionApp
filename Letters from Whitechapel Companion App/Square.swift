//
//  Square.swift
//  Letters from Whitechapel Companion App
//
//  Created by Christopher Bonuel on 5/31/17.
//  Copyright © 2017 Christopher Bonuel. All rights reserved.
//

import Foundation

class Square: LocationType {
    
    // MARK: - Properties
    let id: ID
    var neighbors: [LocationType] = []
    
    // MARK: - Init
    init(_ id: ID) {
        self.id = id
    }
}
