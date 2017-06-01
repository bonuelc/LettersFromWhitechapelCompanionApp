//
//  Map.swift
//  Letters from Whitechapel Companion App
//
//  Created by Christopher Bonuel on 5/31/17.
//  Copyright © 2017 Christopher Bonuel. All rights reserved.
//

import Foundation

// Singleton class
class Map {
    
    // MARK: - Properties
    fileprivate var locations: [LocationType] = []
    static let shared = Map()
    
    // MARK: - Init
    private init() {}
}

// MARK: - Helper Methods
extension Map {
    subscript(index: Int) -> LocationType {
        // Map is one-based to mirror board game
        return locations[index - 1]
    }
}
