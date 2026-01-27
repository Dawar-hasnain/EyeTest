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

    @State private var leftEyeResult: VisualAcuityResult? = nil
    @State private var rightEyeResult: VisualAcuityResult? = nil

    var body: some View {

        // BOTH EYES DONE → SUMMARY
        if let left = leftEyeResult, let right = rightEyeResult {
            FinalVisualAcuitySummaryView(
                leftResult: left,
                rightResult: right,
                onDone: {
                    dismiss()
                }
            )
        }

        // TESTING A SELECTED EYE
        else if let eye = selectedEye {
            VisualAcuityTestView(eye: eye) { result in
                handleResult(result)
            }
            .id(eye)   // 🔑 THIS IS THE FIX
        }


        // NO EYE SELECTED → SELECTION SCREEN
        else {
            EyeSelectionView { eye in
                selectedEye = eye
            }
        }
    }

    // MARK: - Handle Test Result
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
