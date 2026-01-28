//
//  ColorContrastResult.swift
//  OnlyFriendsApp
//
//  Created by Dawar Hasnain on 28/01/26.
//

struct ColorContrastResult {
    let numerator: Int        // 1–6
    let attemptsUsed: Int

    var displayText: String {
        "\(numerator)/6"
    }

    var confidenceText: String {
        switch attemptsUsed {
        case 9...10: return "High confidence"
        case 11...13: return "Moderate confidence"
        default: return "Low confidence"
        }
    }

    var interpretationText: String {
        switch numerator {
        case 6:
            return "Excellent contrast sensitivity"
        case 5:
            return "Very good contrast sensitivity"
        case 4:
            return "Moderate contrast sensitivity"
        case 3:
            return "Reduced contrast sensitivity"
        case 2:
            return "Poor contrast sensitivity"
        default:
            return "Very poor contrast sensitivity"
        }
    }
}
