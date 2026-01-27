//
//  VisualAcuityCoordinatorView.swift
//  OnlyFriendsApp
//
//  Created by Dawar Hasnain on 27/01/26.
//

import SwiftUI

import SwiftUI

struct VisualAcuityCoordinatorView: View {

    @Environment(\.dismiss) private var dismiss

    @State private var selectedEye: EyeType? = nil

    @State private var leftEyeResult: VisualAcuityResult? = nil
    @State private var rightEyeResult: VisualAcuityResult? = nil

    var body: some View {

        // BOTH EYES DONE → SUMMARY
        if let left = leftEyeResult, let right = rightEyeResult {
            FinalVisualAcuitySummaryView(
                leftResult: left,
                rightResult: right,
                onDone: {
                    dismiss() // back to HomeView
                }
            )
        }

        // TEST IN PROGRESS
        else if let eye = selectedEye {
            VisualAcuityTestView(eye: eye) { result in
                handleResult(result)
            }
        }

        // NO EYE SELECTED → SELECTION SCREEN
        else {
            EyeSelectionView { eye in
                selectedEye = eye
            }
        }
    }

    // MARK: - Result Handling
    private func handleResult(_ result: VisualAcuityResult) {

        switch result.eye {
        case .left:
            leftEyeResult = result
            selectedEye = rightEyeResult == nil ? .right : nil

        case .right:
            rightEyeResult = result
            selectedEye = leftEyeResult == nil ? .left : nil
        }
    }
}
