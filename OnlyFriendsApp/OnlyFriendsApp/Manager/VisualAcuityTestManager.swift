//
//  VisualAcuityTestManager.swift
//  OnlyFriendsApp
//
//  Created by Dawar Hasnain on 26/01/26.
//

import Foundation

import CoreGraphics

struct VisualAcuityTestManager {

    // MARK: - Counters
    private(set) var correctCount: Int = 0
    private(set) var attemptCount: Int = 0

    // MARK: - Size control
    private(set) var currentSize: CGFloat = 200
    private let minSize: CGFloat = 40
    private let shrinkFactor: CGFloat = 20  // 20pts decrease per correct

    // MARK: - Result tracking
    private(set) var finalNumerator: Int? = nil   // x / 6

    // MARK: - Rotation
    private(set) var rotationManager = LandoltRotationManager()

    // MARK: - Test state
    var isTestFinished: Bool {
        correctCount == 9 || attemptCount >= 15
    }

    // MARK: - Start / Reset
    mutating func startTest() {
        correctCount = 0
        attemptCount = 0
        currentSize = 200
        finalNumerator = nil
        rotationManager.randomize()
    }

    // MARK: - Answer handling
    mutating func registerAnswer(tappedIndex: Int) -> Bool {
        guard !isTestFinished else { return false }

        attemptCount += 1
        let isCorrect = tappedIndex == rotationManager.expectedSegmentIndex

        if isCorrect {
            correctCount += 1
            currentSize = max(currentSize - shrinkFactor, minSize)

            // Capture result at 9th correct
            if correctCount == 9 {
                finalNumerator = mapSizeToNumerator(currentSize)
            }
        }

        // 🔑 NEW: Capture result if attempts are exhausted
        if attemptCount >= 15 && finalNumerator == nil {
            finalNumerator = mapSizeToNumerator(currentSize)
        }

        rotationManager.randomize()
        return isCorrect
    }

    // MARK: - Size → Relative Snellen (x/6)
    private func mapSizeToNumerator(_ size: CGFloat) -> Int {
        switch size {
        case 0...110:
            return 6   // 6/6 (best achievable)
        case 111...130:
            return 5   // 5/6
        case 131...150:
            return 4   // 4/6
        case 151...170:
            return 3   // 3/6
        default:
            return 2   // 2/6 or worse
        }
    }

}
