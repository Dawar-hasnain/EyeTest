//
//  ProfileSummaryCardView.swift
//  OnlyFriendsApp
//
//  Created by Dawar Hasnain on 30/01/26.
//

import SwiftUI

struct ProfileSummaryCardView: View {

    let profile: UserProfile

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {

            Text("Your Eye Health Profile")
                .font(.headline)

            if !profile.hasMyopia && !profile.hasColorBlindness && !profile.hasAstigmatism {
                Text("No known eye conditions reported")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            } else {

                if profile.hasMyopia {
                    conditionRow(
                        title: "Myopia",
                        value: profile.myopiaPrescription
                    )
                }

                if profile.hasColorBlindness {
                    conditionRow(
                        title: "Color Blindness",
                        value: profile.colorBlindnessType
                    )
                }

                if profile.hasAstigmatism {
                    conditionRow(
                        title: "Astigmatism",
                        value: profile.astigmatismPrescription
                    )
                }
            }
        }
        .padding()
        .background(Color.gray.opacity(0.08))
        .cornerRadius(12)
    }

    // MARK: - Condition Row
    private func conditionRow(title: String, value: String?) -> some View {
        HStack {
            Text(title)
                .font(.subheadline)

            Spacer()

            Text(value?.isEmpty == false ? value! : "Not sure")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}
