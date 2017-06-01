//
//  LocationType.swift
//  Letters from Whitechapel Companion App
//
//  Created by Christopher Bonuel on 5/31/17.
//  Copyright © 2017 Christopher Bonuel. All rights reserved.
//

import Foundation

typealias ID = Int

protocol LocationType: class {
    // MARK: - Properties
    var id: ID { get }
    var neighbors: [LocationType] { get set }
}
