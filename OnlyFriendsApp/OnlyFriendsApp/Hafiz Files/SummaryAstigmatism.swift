//
//  SummaryAstigmatism.swift
//  EyeTest
//
//  Created by Hafiz Rahmadhani on 25/01/26.
//

import SwiftUI

struct SummaryAstigmatism: View {

    let leftResult: Bool
    let rightResult: Bool
    let onDone: () -> Void

    // 🔑 Load profile once for contextual display
    private let profile = UserProfileManager.shared.loadProfile()

    var body: some View {
        VStack(spacing: 30) {

            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 80))
                .foregroundColor(.green)
                .padding(.top, 40)

            Text("Astigmatism Summary")
                .font(.largeTitle)
                .fontWeight(.bold)

            VStack(spacing: 16) {
                eyeResultView("Left Eye", isNormal: leftResult)
                eyeResultView("Right Eye", isNormal: rightResult)
            }
            .padding(.horizontal)

//            Text("This test is for screening purposes only and does not replace a professional eye exam.")
//                .font(.caption)
//                .foregroundColor(.secondary)
//                .multilineTextAlignment(.center)
//                .padding(.horizontal, 40)

            Spacer()

            SummaryDisclaimerView()

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
    }

    // MARK: - Eye Result Block
    private func eyeResultView(_ title: String, isNormal: Bool) -> some View {
        VStack(spacing: 8) {

            Text(title)
                .font(.headline)

            // MARK: - Prescribed (Self-reported)
            if profile?.hasAstigmatism == true {
                HStack {
                    Text("Prescribed (Self-reported)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    Spacer()

                    Text(profile?.astigmatismPrescription?.isEmpty == false
                         ? profile!.astigmatismPrescription!
                         : "Not sure")
                        .font(.subheadline)
                }
            }

            // MARK: - Measured Result
            HStack {
                Text("Measured (This test)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Spacer()

                HStack {
                    Text(isNormal ? "Normal" : "Indication of Astigmatism")
                        .fontWeight(.bold)
                    Image(systemName: isNormal
                          ? "checkmark.seal.fill"
                          : "exclamationmark.triangle.fill")
                }
                .foregroundColor(isNormal ? .green : .orange)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.08))
        .cornerRadius(12)
    }
}

//#Preview {
//    SummaryAstigmatism(leftResult: true, rightResult: false, isNavigationActive: .constant(true))
//}
