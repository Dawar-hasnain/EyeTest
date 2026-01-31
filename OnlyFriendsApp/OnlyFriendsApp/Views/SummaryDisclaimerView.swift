//
//  SummaryDisclaimerView.swift
//  OnlyFriendsApp
//
//  Created by Dawar Hasnain on 30/01/26.
//

import SwiftUI

struct SummaryDisclaimerView: View {

    var body: some View {
        VStack(spacing: 6) {
            Text("Disclaimer")
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundColor(.secondary)

            Text(
                "These tests are for screening and informational purposes only and do not replace a professional eye examination."
            )
            .font(.footnote)
            .foregroundColor(.secondary)
            .multilineTextAlignment(.center)
        }
        .padding(.horizontal, 40)
        .padding(.bottom, 8)
    }
}
