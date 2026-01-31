//
//  SummaryColorBlind.swift
//  EyeTest
//
//  Created by Hafiz Rahmadhani on 25/01/26.
//

import SwiftUI

struct SummaryColorBlind: View {

    let totalCorrect: Int
    let totalQuestions: Int
    let onDone: () -> Void

    @State private var navigateToLeftEye = false

    // 🔑 Load profile once for contextual display
    private let profile = UserProfileManager.shared.loadProfile()

    var isNormal: Bool {
        totalCorrect >= 5
    }

    var body: some View {
        VStack(spacing: 25) {

            Spacer()

            // MARK: - Score Ring
            ZStack {
                Circle()
                    .stroke(
                        isNormal ? Color.green.opacity(0.2) : Color.orange.opacity(0.2),
                        lineWidth: 15
                    )
                    .frame(width: 150, height: 150)

                VStack {
                    Text("\(totalCorrect)/\(totalQuestions)")
                        .font(.system(size: 40, weight: .bold))
                    Text("Correct")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }

            Text(isNormal ? "Normal Vision" : "Vision Insight")
                .font(.largeTitle)
                .fontWeight(.bold)

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
                .padding(.horizontal, 40)
            }

            // MARK: - Measured Result
            VStack(spacing: 6) {
                Text("Measured:")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Text(
                    isNormal
                    ? "You were able to correctly identify most color plates."
                    : "You missed several plates. This may indicate difficulty distinguishing certain color patterns."
                )
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
                .foregroundColor(.secondary)
            }

            Spacer()

            SummaryDisclaimerView()
            
            // MARK: - Next Test
            Button(action: {
                navigateToLeftEye = true
            }) {
                Text("Next: Astigmatism Check")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.horizontal, 40)
            
            // MARK: - Back to Home
            Button(action: {
                onDone()
            }) {
                Text("Back to Home")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 30)
        }
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $navigateToLeftEye) {
            LeftEye()
        }
    }
}


//#Preview {
//    SummaryColorBlind(totalCorrect: 4, totalQuestions: 6, onDone: {
//        dismiss()
//    })
//}
