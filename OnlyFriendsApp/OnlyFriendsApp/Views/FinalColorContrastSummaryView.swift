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

    // 🔑 Load profile once for contextual display
    private let profile = UserProfileManager.shared.loadProfile()

    var body: some View {
        VStack(spacing: 32) {

            // MARK: - Title
            Text("Color Contrast Summary")
                .font(.largeTitle)
                .fontWeight(.bold)

            // MARK: - Results
            VStack(spacing: 20) {
                eyeResultView("Left Eye", leftResult)
                eyeResultView("Right Eye", rightResult)
            }

            Spacer()

            SummaryDisclaimerView()
            
            // MARK: - Go Home Button
            Button("Go to Home") {
                onDone()
            }
            .fontWeight(.bold)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(12)
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }

    // MARK: - Eye Result Block
    private func eyeResultView(_ title: String, _ result: ColorContrastResult) -> some View {
        VStack(spacing: 8) {

            Text(title)
                .font(.headline)

            // MARK: - Prescribed (Self-reported)
            if profile?.hasColorBlindness == true {
                HStack {
                    Text("Prescribed (Self-reported)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    Spacer()

                    Text(profile?.colorBlindnessType?.isEmpty == false
                         ? profile!.colorBlindnessType!
                         : "Not sure")
                        .font(.subheadline)
                }
            }

            // MARK: - Measured Result
            HStack {
                Text("Measured:")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Spacer()

                Text(result.displayText)   // e.g. 5/6
                    .font(.title2)
                    .fontWeight(.bold)
            }

            // MARK: - Interpretation & Confidence
            Text(result.interpretationText)
                .font(.footnote)
                .foregroundColor(.gray)

            Text(result.confidenceText)
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.gray.opacity(0.08))
        .cornerRadius(12)
    }
}
