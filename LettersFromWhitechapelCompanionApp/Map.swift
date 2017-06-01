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
    
    // MARK: - Internal Classes
    fileprivate class Circle: LocationType {
        
        // MARK: - Properties
        let id: ID
        var neighbors: [LocationType] = []
        
        // MARK: - Init
        init(_ id: ID) {
            self.id = id
        }
    }

    fileprivate class Square: LocationType {
        
        // MARK: - Properties
        let id: ID
        var neighbors: [LocationType] = []
        
        // MARK: - Init
        init(_ id: ID) {
            self.id = id
        }
    }
    
    // MARK: - Properties
    fileprivate(set) var locations: [LocationType] = []
    private lazy var circles: [ID] = {
        return self.locations.flatMap { $0 as? Circle }.map { $0.id }
    }()
    private(set) lazy var jacksPossibleHideouts: [ID] = {
        return self.circles.filter { !self.womanTokensPossibleStartingLocations.contains($0) }
    }()
    private(set) var womanTokensPossibleStartingLocations: [ID] = [3, 21, 27, 65, 84, 147, 149, 158]
    static let shared = Map()
    
    // MARK: - Init
    private init() {
        initNodes()
        initEdges()
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

// MARK: - CustomStringConvertible
extension Map: CustomStringConvertible {
    var description: String {
        return locations.map { $0.description }.joined(separator: "\n")
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
    
    fileprivate func initEdges() {
        // MARK: - add edges for normal movement
        addEdges(from: 1, to: 196, 203)
        addEdges(from: 2, to: 197, 198)
        addEdges(from: 3, to: 198, 199)
        addEdges(from: 4, to: 199, 206)
        addEdges(from: 5, to: 199, 200)
        addEdges(from: 6, to: 202, 218)
        addEdges(from: 7, to: 203, 219)
        addEdges(from: 8, to: 220, 221)
        addEdges(from: 9, to: 204, 205, 221)
        addEdges(from: 10, to: 221, 222)
        addEdges(from: 11, to: 205, 206)
        addEdges(from: 12, to: 206, 207)
        addEdges(from: 13, to: 207, 224)
        addEdges(from: 14, to: 224, 244)
        addEdges(from: 15, to: 208, 245)
        addEdges(from: 16, to: 209, 246)
        addEdges(from: 17, to: 209, 210)
        addEdges(from: 18, to: 210, 211, 225)
        addEdges(from: 19, to: 212, 225)
        addEdges(from: 20, to: 212, 213)
        addEdges(from: 21, to: 215, 216)
        addEdges(from: 22, to: 277, 278)
        addEdges(from: 23, to: 217, 278)
        addEdges(from: 24, to: 201, 218, 227)
        addEdges(from: 25, to: 218, 227, 228)
        addEdges(from: 26, to: 28, 196, 219, 220, 229)
        addEdges(from: 27, to: 229, 230)
        addEdges(from: 28, to: 26, 220, 230)
        addEdges(from: 29, to: 235, 236)
        addEdges(from: 30, to: 222, 223, 236)
        addEdges(from: 31, to: 242, 243, 429)
        addEdges(from: 32, to: 224, 243)
        addEdges(from: 33, to: 244, 245)
        addEdges(from: 34, to: 245, 270)
        addEdges(from: 35, to: 246, 271)
        addEdges(from: 36, to: 246, 247)
        addEdges(from: 37, to: 271, 272)
        addEdges(from: 38, to: 247, 272)
        addEdges(from: 39, to: 225, 272, 273)
        addEdges(from: 40, to: 213, 275)
        addEdges(from: 41, to: 214, 276)
        addEdges(from: 42, to: 226, 276, 277)
        addEdges(from: 43, to: 231, 237)
        addEdges(from: 44, to: 232, 228, 229, 233, 238)
        addEdges(from: 45, to: 47, 239, 251)
        addEdges(from: 46, to: 233, 234, 239)
        addEdges(from: 47, to: 45, 239, 251, 252)
        addEdges(from: 48, to: 234, 240, 253)
        addEdges(from: 49, to: 240, 241)
        addEdges(from: 50, to: 236, 241, 242)
        addEdges(from: 51, to: 256, 266)
        addEdges(from: 52, to: 256, 257, 267, 429)
        addEdges(from: 53, to: 267, 268, 269)
        addEdges(from: 54, to: 244, 257, 269)
        addEdges(from: 55, to: 270, 292)
        addEdges(from: 56, to: 273, 274, 293)
        addEdges(from: 57, to: 274, 275)
        addEdges(from: 58, to: 276, 298, 299)
        addEdges(from: 59, to: 238, 248)
        addEdges(from: 60, to: 248, 249)
        addEdges(from: 61, to: 251, 252)
        addEdges(from: 62, to: 253, 263)
        addEdges(from: 63, to: 254, 264)
        addEdges(from: 64, to: 254, 255)
        addEdges(from: 65, to: 264, 265, 287)
        addEdges(from: 66, to: 255, 265)
        addEdges(from: 67, to: 266, 267)
        addEdges(from: 68, to: 269, 290)
        addEdges(from: 69, to: 291, 294)
        addEdges(from: 70, to: 294, 295)
        addEdges(from: 71, to: 295, 296, 338)
        addEdges(from: 72, to: 296, 297)
        addEdges(from: 73, to: 297, 298, 299)
        addEdges(from: 74, to: 297, 300)
        addEdges(from: 75, to: 300, 341)
        addEdges(from: 76, to: 300, 301)
        addEdges(from: 77, to: 301, 302)
        addEdges(from: 78, to: 259, 261, 262)
        addEdges(from: 79, to: 250, 259, 262)
        addEdges(from: 80, to: 262, 263, 284)
        addEdges(from: 81, to: 284, 285)
        addEdges(from: 82, to: 263, 264)
        addEdges(from: 83, to: 287, 311)
        addEdges(from: 84, to: 288, 312)
        addEdges(from: 85, to: 289, 335)
        addEdges(from: 86, to: 289, 290)
        addEdges(from: 87, to: 295, 337)
        addEdges(from: 88, to: 296, 339)
        addEdges(from: 89, to: 340, 343)
        addEdges(from: 90, to: 340, 341)
        addEdges(from: 91, to: 343, 344)
        addEdges(from: 92, to: 344, 365)
        addEdges(from: 93, to: 344, 345)
        addEdges(from: 94, to: 342, 345)
        addEdges(from: 95, to: 258, 260)
        addEdges(from: 96, to: 261,  280, 281)
        addEdges(from: 97, to: 262, 281, 283)
        addEdges(from: 98, to: 286, 310)
        addEdges(from: 99, to: 313, 325)
        addEdges(from: 100, to: 314, 325, 332)
        addEdges(from: 101, to: 335, 359)
        addEdges(from: 102, to: 291, 360)
        addEdges(from: 103, to: 294, 361)
        addEdges(from: 104, to: 338, 362, 363, 367)
        addEdges(from: 105, to: 363, 364)
        addEdges(from: 106, to: 364, 368)
        addEdges(from: 107, to: 364, 365)
        addEdges(from: 108, to: 368, 369)
        addEdges(from: 109, to: 365, 366)
        addEdges(from: 110, to: 369, 370)
        addEdges(from: 111, to: 370, 373)
        addEdges(from: 112, to: 279, 303)
        addEdges(from: 113, to: 279, 305)
        addEdges(from: 114, to: 280, 305, 307)
        addEdges(from: 115, to: 282, 307)
        addEdges(from: 116, to: 282, 308)
        addEdges(from: 117, to: 283, 309)
        addEdges(from: 118, to: 285, 323, 324)
        addEdges(from: 119, to: 324, 327)
        addEdges(from: 120, to: 324, 325)
        addEdges(from: 121, to: 327, 329, 330)
        addEdges(from: 122, to: 331, 332)
        addEdges(from: 123, to: 331, 355)
        addEdges(from: 124, to: 333, 334)
        addEdges(from: 125, to: 355, 358)
        addEdges(from: 126, to: 335, 358, 359)
        addEdges(from: 127, to: 336, 360, 361)
        addEdges(from: 128, to: 361, 375)
        addEdges(from: 129, to: 362, 376)
        addEdges(from: 130, to: 363, 377)
        addEdges(from: 131, to: 371, 379)
        addEdges(from: 132, to: 369, 372)
        addEdges(from: 133, to: 372, 380)
        addEdges(from: 134, to: 372, 373)
        addEdges(from: 135, to: 303, 304)
        addEdges(from: 136, to: 304, 317)
        addEdges(from: 137, to: 306, 307)
        addEdges(from: 138, to: 306, 320)
        addEdges(from: 139, to: 321, 322)
        addEdges(from: 140, to: 353, 354)
        addEdges(from: 141, to: 356, 357)
        addEdges(from: 142, to: 381, 382)
        addEdges(from: 143, to: 360, 374, 375)
        addEdges(from: 144, to: 375, 376)
        addEdges(from: 145, to: 367, 374, 377, 386)
        addEdges(from: 146, to: 379, 380)
        addEdges(from: 147, to: 373, 380)
        addEdges(from: 148, to: 304, 315, 316)
        addEdges(from: 149, to: 316, 317)
        addEdges(from: 150, to: 322, 348)
        addEdges(from: 151, to: 326, 328, 349)
        addEdges(from: 152, to: 351, 352)
        addEdges(from: 153, to: 328, 352)
        addEdges(from: 154, to: 353, 396)
        addEdges(from: 155, to: 357, 410)
        addEdges(from: 156, to: 381, 388)
        addEdges(from: 157, to: 388, 389)
        addEdges(from: 158, to: 384, 389)
        addEdges(from: 159, to: 385, 390, 391)
        addEdges(from: 160, to: 386, 391, 421)
        addEdges(from: 161, to: 383, 387, 422)
        addEdges(from: 162, to: 315, 318)
        addEdges(from: 163, to: 318, 319)
        addEdges(from: 164, to: 320, 321, 346)
        addEdges(from: 165, to: 392, 393)
        addEdges(from: 166, to: 350, 351)
        addEdges(from: 167, to: 392, 404)
        addEdges(from: 168, to: 395, 396)
        addEdges(from: 169, to: 396, 408)
        addEdges(from: 170, to: 356, 396, 409)
        addEdges(from: 171, to: 411, 416)
        addEdges(from: 172, to: 390, 417)
        addEdges(from: 173, to: 391, 420)
        addEdges(from: 174, to: 319, 346)
        addEdges(from: 175, to: 347, 399)
        addEdges(from: 176, to: 350, 401)
        addEdges(from: 177, to: 393, 394)
        addEdges(from: 178, to: 394, 403, 404)
        addEdges(from: 179, to: 404, 405)
        addEdges(from: 180, to: 395, 407)
        addEdges(from: 181, to: 408, 409)
        addEdges(from: 182, to: 410, 412)
        addEdges(from: 183, to: 411, 412, 413, 414)
        addEdges(from: 184, to: 413, 425)
        addEdges(from: 185, to: 414, 415, 416, 417, 418)
        addEdges(from: 186, to: 423, 424)
        addEdges(from: 187, to: 418, 424)
        addEdges(from: 188, to: 398, 400)
        addEdges(from: 189, to: 403, 405)
        addEdges(from: 190, to: 402, 406)
        addEdges(from: 191, to: 406, 407)
        addEdges(from: 192, to: 412, 425)
        addEdges(from: 193, to: 423, 426, 427)
        addEdges(from: 194, to: 426, 428)
        addEdges(from: 195, to: 420, 428)
        addEdges(from: 196, to: 197)
        addEdges(from: 197, to: 204)
        addEdges(from: 198, to: 205)
        
        addEdges(from: 200, to: 207, 208)
        addEdges(from: 201, to: 202)
        addEdges(from: 202, to: 203)
        
        addEdges(from: 204, to: 220)
        
        addEdges(from: 206, to: 222)
        
        addEdges(from: 208, to: 209)
        
        addEdges(from: 210, to: 247)
        addEdges(from: 211, to: 212)
        
        addEdges(from: 213, to: 214)
        addEdges(from: 214, to: 215)
        addEdges(from: 215, to: 225)
        addEdges(from: 216, to: 217)
        
        addEdges(from: 218, to: 219)
        addEdges(from: 219, to: 228)
        
        
        
        addEdges(from: 223, to: 224)
        
        
        
        addEdges(from: 227, to: 232)
        
        addEdges(from: 229, to: 233)
        addEdges(from: 230, to: 234)
        addEdges(from: 231, to: 232)
        
        addEdges(from: 233, to: 250)
        addEdges(from: 234, to: 235, 239)
        
        addEdges(from: 236, to: 241)
        addEdges(from: 237, to: 238)
        
        
        addEdges(from: 240, to: 254)
        addEdges(from: 241, to: 255)
        addEdges(from: 242, to: 256)
        addEdges(from: 243, to: 257)
        
        addEdges(from: 245, to: 246)
        
        
        addEdges(from: 248, to: 258)
        addEdges(from: 249, to: 259)
        
        addEdges(from: 251, to: 252)
        
        addEdges(from: 253, to: 254)
        
        
        
        
        addEdges(from: 258, to: 261)
        
        addEdges(from: 260, to: 279, 280)
        
        
        addEdges(from: 263, to: 286)
        addEdges(from: 264, to: 287)
        addEdges(from: 265, to: 266, 288)
        
        
        addEdges(from: 268, to: 270)
        
        addEdges(from: 270, to: 271)
        
        
        
        
        addEdges(from: 275, to: 276, 298)
        
        
        addEdges(from: 278, to: 302)
        
        
        addEdges(from: 281, to: 282)
        
        
        
        
        
        
        
        addEdges(from: 289, to: 314)
        addEdges(from: 290, to: 291, 292)
        
        addEdges(from: 292, to: 293)
        
        
        
        
        addEdges(from: 297, to: 340)
        
        addEdges(from: 299, to: 300)
        
        addEdges(from: 301, to: 342)
        
        addEdges(from: 303, to: 315)
        addEdges(from: 304, to: 305)
        addEdges(from: 305, to: 306)
        
        
        addEdges(from: 308, to: 322)
        addEdges(from: 309, to: 323)
        addEdges(from: 310, to: 324)
        addEdges(from: 311, to: 325)
        addEdges(from: 312, to: 313)
        addEdges(from: 313, to: 314)
        
        
        addEdges(from: 316, to: 318)
        addEdges(from: 317, to: 319)
        
        addEdges(from: 319, to: 320)
        addEdges(from: 320, to: 321)
        
        addEdges(from: 322, to: 323, 326)
        addEdges(from: 323, to: 326)
        addEdges(from: 324, to: 330)
        
        
        addEdges(from: 327, to: 328)
        addEdges(from: 328, to: 329)
        
        addEdges(from: 330, to: 331)
        
        addEdges(from: 332, to: 333, 355)
        addEdges(from: 333, to: 355)
        addEdges(from: 334, to: 335)
        
        
        addEdges(from: 337, to: 362)
        
        addEdges(from: 339, to: 363)
        
        addEdges(from: 341, to: 342, 344)
        
        addEdges(from: 343, to: 364)
        
        addEdges(from: 345, to: 366)
        addEdges(from: 346, to: 347, 398)
        addEdges(from: 347, to: 398)
        addEdges(from: 348, to: 349, 350)
        
        
        addEdges(from: 351, to: 392)
        addEdges(from: 352, to: 395)
        
        addEdges(from: 354, to: 355, 356)
        addEdges(from: 355, to: 357)
        
        
        addEdges(from: 358, to: 374)
        
        
        
        
        
        
        addEdges(from: 365, to: 369)
        addEdges(from: 366, to: 370)
        
        addEdges(from: 368, to: 371)
        
        
        addEdges(from: 371, to: 372)
        
        
        addEdges(from: 374, to: 381)
        addEdges(from: 375, to: 385)
        addEdges(from: 376, to: 391)
        addEdges(from: 377, to: 378, 383)
        addEdges(from: 378, to: 379, 387)
        
        
        
        addEdges(from: 382, to: 384)
        
        
        
        
        
        addEdges(from: 388, to: 397)
        addEdges(from: 389, to: 390, 416)
        
        
        addEdges(from: 392, to: 394)
        addEdges(from: 393, to: 403)
        
        
        
        addEdges(from: 397, to: 411)
        
        addEdges(from: 399, to: 400)
        addEdges(from: 400, to: 401)
        addEdges(from: 401, to: 402)
        
        
        
        addEdges(from: 405, to: 406)
        
        addEdges(from: 407, to: 408)
        
        addEdges(from: 409, to: 410)
        
        
        addEdges(from: 412, to: 413)
        addEdges(from: 413, to: 415)
        addEdges(from: 414, to: 416)
        
        
        addEdges(from: 417, to: 418)
        addEdges(from: 418, to: 419, 420)
        addEdges(from: 419, to: 420)
        
        addEdges(from: 421, to: 422)
        
        
        addEdges(from: 424, to: 427)
        addEdges(from: 425, to: 426)
        
        addEdges(from: 427, to: 428)
        
        // TODO: - add edges for special (alley) movement
    }
}
