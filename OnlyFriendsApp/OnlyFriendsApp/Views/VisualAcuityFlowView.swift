//
//  VisualAcuityFlowView.swift
//  OnlyFriendsApp
//
//  Created by Dawar Hasnain on 27/01/26.
//

import SwiftUI

struct VisualAcuityFlowView: View {

    @Environment(\.dismiss) private var dismiss

    @State private var selectedEye: EyeType? = nil
    @State private var nextEyeToTest: EyeType = .right   // 🔑 start with Right eye

    @State private var leftEyeResult: VisualAcuityResult? = nil
    @State private var rightEyeResult: VisualAcuityResult? = nil

    var body: some View {

        // 1️⃣ BOTH EYES DONE → SUMMARY
        if let left = leftEyeResult, let right = rightEyeResult {
            FinalVisualAcuitySummaryView(
                leftResult: left,
                rightResult: right,
                onDone: {
                    dismiss()
                }
            )
        }

        // 2️⃣ RUNNING TEST
        else if let eye = selectedEye {
            VisualAcuityTestView(eye: eye) { result in
                handleResult(result)
            }
            .id(eye)   // 🔑 Force fresh state per eye
        }

        // 3️⃣ EYE SELECTION
        else {
            EyeSelectionView(
                eyeToTest: nextEyeToTest,
                onSelectEye: { eye in
                    selectedEye = eye
                }
            )
        }
    }

    // MARK: - Handle Test Result
    private func handleResult(_ result: VisualAcuityResult) {

        switch result.eye {

        case .right:
            rightEyeResult = result
            nextEyeToTest = .left      // 🔑 flip eye
            selectedEye = nil          // go back to EyeSelectionView

        case .left:
            leftEyeResult = result
            selectedEye = nil          // triggers summary
        }
    }
}
