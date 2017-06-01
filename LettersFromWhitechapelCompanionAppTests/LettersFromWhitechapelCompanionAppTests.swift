//
//  LettersFromWhitechapelCompanionAppTests.swift
//  LettersFromWhitechapelCompanionAppTests
//
//  Created by Christopher Bonuel on 6/1/17.
//  Copyright © 2017 Christopher Bonuel. All rights reserved.
//

import XCTest
@testable import LettersFromWhitechapelCompanionApp

class LettersFromWhitechapelCompanionAppTests: XCTestCase {
    func testMapCount() {
        let numberOfLocations = 429
        XCTAssertEqual(Map.shared.count, numberOfLocations,
                       "Map should have \(numberOfLocations) locations (nodes)")
    }
}
