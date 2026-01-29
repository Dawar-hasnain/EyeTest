//
//  FinalColorContrastSummaryView.swift
//  OnlyFriendsApp
//
//  Created by Dawar Hasnain on 28/01/26.
//

import SwiftUI

struct FinalColorContrastSummaryView: View {

    let leftResult: ColorContrastResult
    let rightResult: ColorContrastResult
    let onDone: () -> Void

    var body: some View {
        VStack(spacing: 32) {

            // MARK: - Title
            Text("Color Contrast Summary")
                .font(.largeTitle)
                .fontWeight(.bold)

            // MARK: - Results
            VStack(spacing: 16) {
                eyeResultView("Left Eye", leftResult)
                eyeResultView("Right Eye", rightResult)
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
    private func eyeResultView(_ title: String, _ result: ColorContrastResult) -> some View {
        VStack(spacing: 6) {
            Text(title)
                .font(.headline)

            Text(result.displayText)        // e.g. 5/6
                .font(.system(size: 40, weight: .bold))

            Text(result.interpretationText)
                .foregroundColor(.gray)

            Text(result.confidenceText)
                .foregroundColor(.gray)
        }
    }
}
