//
//  VisualAcuityLevel.swift
//  OnlyFriendsApp
//
//  Created by Dawar Hasnain on 26/01/26.
//

import Foundation

enum VisualAcuityLevel: Int, CaseIterable {
    case level1 = 0   // 6/60
    case level2       // 6/36
    case level3       // 6/24
    case level4       // 6/18
    case level5       // 6/12
    case level6       // 6/9
    case level7       // 6/6

    var snellenValue: String {
        switch self {
        case .level1: return "6/60"
        case .level2: return "6/36"
        case .level3: return "6/24"
        case .level4: return "6/18"
        case .level5: return "6/12"
        case .level6: return "6/9"
        case .level7: return "6/6"
        }
    }

    var imageSize: CGFloat {
        switch self {
        case .level1: return 120
        case .level2: return 100
        case .level3: return 85
        case .level4: return 70
        case .level5: return 60
        case .level6: return 50
        case .level7: return 40
        }
    }
}
