//
//  EyeSelectionViewColorContrast.swift
//  OnlyFriendsApp
//
//  Created by Dawar Hasnain on 28/01/26.
//

import SwiftUI

struct EyeSelectionViewColorContrast: View {

    let onSelectEye: (EyeType) -> Void

    var body: some View {
        VStack(spacing: 40) {

            Text("Color Contrast Test")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Select the eye you want to test")
                .font(.headline)
                .foregroundColor(.gray)

            VStack(spacing: 20) {

                Button {
                    onSelectEye(.left)
                } label: {
                    Text("Left Eye")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)

                Button {
                    onSelectEye(.right)
                } label: {
                    Text("Right Eye")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding()
    }
}
