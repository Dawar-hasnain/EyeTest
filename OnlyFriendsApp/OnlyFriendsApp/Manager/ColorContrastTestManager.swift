//
//  ColorContrastTestManager.swift
//  OnlyFriendsApp
//
//  Created by Dawar Hasnain on 28/01/26.
//

import CoreGraphics

struct ColorContrastTestManager {

    // MARK: - Counters
    private(set) var correctCount: Int = 0
    private(set) var attemptCount: Int = 0

    // MARK: - Size control
    private(set) var currentSize: CGFloat = 200
    private let minSize: CGFloat = 40
    private let sizeStep: CGFloat = 0

    // MARK: - Contrast control
    private(set) var currentContrast: CGFloat = 99   // percentage (0–100)
    private let minContrast: CGFloat = 0.5
    private let contrastStep: CGFloat = 11

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
        currentContrast = 99
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

            // Shrink size
            currentSize = max(currentSize - sizeStep, minSize)

            // Reduce contrast
            currentContrast = max(currentContrast - (contrastStep * 1.1), minContrast)
            //currentContrast = currentContrast * contrastStep

            // Capture result at 9th correct
            if correctCount == 9 {
                finalNumerator = mapContrastToNumerator(Int(currentContrast))
            }
        }

        // Capture result if attempts exhausted
        if attemptCount >= 15 && finalNumerator == nil {
            finalNumerator = mapContrastToNumerator(Int(currentContrast))
        }

        rotationManager.randomize()
        return isCorrect
    }
    
    private func mapContrastToNumerator(_ contrast: Int) -> Int {
        switch contrast {
        case 0...20:
            return 6   // 6/6 – excellent contrast sensitivity
        case 21...35:
            return 5   // 5/6
        case 36...50:
            return 4   // 4/6
        case 51...70:
            return 3   // 3/6
        case 71...85:
            return 2   // 2/6
        default:
            return 1   // 1/6 – very poor contrast sensitivity
        }
    }

}
