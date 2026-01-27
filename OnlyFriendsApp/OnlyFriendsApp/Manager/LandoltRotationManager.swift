//
//  LandoltRotationManager.swift
//  OnlyFriendsApp
//
//  Created by Dawar Hasnain on 26/01/26.
//

import Foundation

struct LandoltRotationManager {
    private(set) var currentDirection: LandoltDirection = .top
    
    mutating func randomize() {
        currentDirection = LandoltDirection.allCases.randomElement()!
    }
    
    var expectedSegmentIndex: Int {
        currentDirection.rawValue
    }
    
    var rotationAngle: Double{
        Double(currentDirection.rawValue) * 45 + 68 // we have rotated it to our desired 22 degree
        //currentDirection.angle
    }
}
