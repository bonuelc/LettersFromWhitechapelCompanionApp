//
//  LocationType.swift
//  Letters from Whitechapel Companion App
//
//  Created by Christopher Bonuel on 5/31/17.
//  Copyright © 2017 Christopher Bonuel. All rights reserved.
//

import Foundation

typealias ID = Int

protocol LocationType: class, CustomStringConvertible {
    
    // MARK: - Properties
    var id: ID { get }
    var neighbors: [LocationType] { get set }
    
    // MARK: - Methods
    func add(neighbor: LocationType)
}

// MARK: - Helper Methods
extension LocationType {
    func add(neighbor: LocationType) {
        // to guard against human error in manual map building
        precondition(self !== neighbor)
        
        // a.add(neighbor: b) is equivalent to b.add(neighbor: a)
        neighbors.append(neighbor)
        neighbor.neighbors.append(self)
    }
}

// MARK: - CustomStringConvertible
extension LocationType {
    var description: String {
        return "\(id): [" + neighbors.map { "\($0.id)" }.joined(separator: ", ") + "]"
    }
}
