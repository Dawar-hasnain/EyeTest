//
//  FinalVisualAcuitySummaryView.swift
//  OnlyFriendsApp
//
//  Created by Dawar Hasnain on 27/01/26.
//

import SwiftUI

struct FinalVisualAcuitySummaryView: View {

    let leftResult: VisualAcuityResult
    let rightResult: VisualAcuityResult
    let onDone: () -> Void

    var body: some View {
        VStack(spacing: 32) {

            // MARK: - Title
            Text("Visual Acuity Summary")
                .font(.largeTitle)
                .fontWeight(.bold)

            // MARK: - Results
            VStack(spacing: 16) {
                eyeResultView(leftResult)
                eyeResultView(rightResult)
            }

            Spacer()

            // MARK: - Go Home Button
            Button("Go to Home") {
                onDone()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }

    // MARK: - Eye Result Block
    private func eyeResultView(_ result: VisualAcuityResult) -> some View {
        VStack(spacing: 6) {
            Text(result.eye.rawValue)
                .font(.headline)

            Text(result.displayText)
            //Text(result.snellenValue)
                .font(.system(size: 40, weight: .bold))

            Text(result.confidenceText)
                .foregroundColor(.gray)
        }
    }
}
