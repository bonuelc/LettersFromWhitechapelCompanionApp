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
    private init() {
        initNodes()
    }
    
    // MARK: - Methods
    fileprivate func addEdge(between a: LocationType, and b: LocationType) {
        a.add(neighbor: b)
    }
}

// MARK: - Helper Methods
extension Map {
    
    subscript(index: Int) -> LocationType {
        // Map is one-based to mirror board game
        return locations[index - 1]
    }
    
    fileprivate func addEdge(between locationID1: ID, and locationID2: ID) {
        let location1 = self[locationID1], location2 = self[locationID2]
        addEdge(between: location1, and: location2)
    }
    
    fileprivate func addEdges(from sourceID: ID, to destinationIDs: ID...) {
        // where clause prevents duplicate edges to guard against
        // human error in manual map building
        for destinationID in destinationIDs where sourceID < destinationID {
            addEdge(between: sourceID, and: destinationID)
        }
    }
}

// MARK: - Initializer Helper Methods
extension Map {
    fileprivate func initNodes() {
        // don't allow method to be called more than once
        guard locations.isEmpty else { return }
        
        for c in 1...195 { locations.append(Circle(c)) }
        for s in 196...429 { locations.append(Square(s)) }
    }
}
