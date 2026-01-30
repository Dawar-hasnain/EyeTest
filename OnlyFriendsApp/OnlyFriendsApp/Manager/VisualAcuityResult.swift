//
//  VisualAcuityResult.swift
//  OnlyFriendsApp
//
//  Created by Dawar Hasnain on 26/01/26.
//

struct VisualAcuityResult {
    let eye: EyeType
    let numerator: Int   // 6, 5, 4, 3, etc.
    let attemptsUsed: Int

    var displayText: String {
        "\(numerator)/6"
    }

    var confidenceText: String {
        switch attemptsUsed {
        case 9: return "High confidence"
        case 10...12: return "Moderate confidence"
        default: return "Low confidence"
        }
    }
}
