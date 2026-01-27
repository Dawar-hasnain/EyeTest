//
//  LandoltDirection.swift
//  OnlyFriendsApp
//
//  Created by Dawar Hasnain on 26/01/26.
//

import Foundation

enum LandoltDirection: Int, CaseIterable {
    case top = 0
    case topRight
    case right
    case bottomRight
    case bottom
    case bottomLeft
    case left
    case topLeft
    
    var angle: Double {
        Double(rawValue) * 45
    }
}
