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

    // 🔑 Load profile once for contextual display
    private let profile = UserProfileManager.shared.loadProfile()

    var body: some View {
        VStack(spacing: 32) {

            // MARK: - Title
            Text("Visual Acuity Summary")
                .font(.largeTitle)
                .fontWeight(.bold)

            // MARK: - Results
            VStack(spacing: 20) {
                eyeResultView(leftResult)
                eyeResultView(rightResult)
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
    private func eyeResultView(_ result: VisualAcuityResult) -> some View {
        VStack(spacing: 8) {

            Text(result.eye.rawValue)
                .font(.headline)

            // MARK: - Prescribed (Self-reported)
            if profile?.hasMyopia == true {
                HStack {
                    Text("Prescribed (Self-reported)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    Spacer()

                    Text(profile?.myopiaPrescription?.isEmpty == false
                         ? profile!.myopiaPrescription!
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

                Text(result.displayText)
                    .font(.title2)
                    .fontWeight(.bold)
            }

            // MARK: - Confidence
            Text(result.confidenceText)
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.gray.opacity(0.08))
        .cornerRadius(12)
    }
}
