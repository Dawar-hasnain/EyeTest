//
//  EyeSelectionViewColorContrast.swift
//  OnlyFriendsApp
//
//  Created by Dawar Hasnain on 28/01/26.
//

import SwiftUI

struct EyeSelectionViewColorContrast: View {

    let eyeToTest: EyeType
    let onSelectEye: (EyeType) -> Void

    var body: some View {
        VStack(spacing: 20) {

            // MARK: - Eye Icons
            HStack(spacing: 30) {

                VStack {
                    Image(systemName: eyeToTest == .left ? "eye.fill" : "eye.slash.fill")
                        .font(.system(size: 50))
                        .foregroundColor(eyeToTest == .left ? .blue : .gray)

                    Text("Left")
                        .font(.caption)
                        .foregroundColor(eyeToTest == .left ? .primary : .secondary)
                }

                VStack {
                    Image(systemName: eyeToTest == .right ? "eye.fill" : "eye.slash.fill")
                        .font(.system(size: 50))
                        .foregroundColor(eyeToTest == .right ? .blue : .gray)

                    Text("Right")
                        .font(.caption)
                        .foregroundColor(eyeToTest == .right ? .primary : .secondary)
                }
            }
            .padding()

            // MARK: - Instruction
            Text(
                eyeToTest == .right
                ? "Cover your Left eye"
                : "Cover your Right eye"
            )
            .font(.title2)
            .fontWeight(.bold)
            .padding()

            // MARK: - Next Button
            Button {
                onSelectEye(eyeToTest)
            } label: {
                Text("Next")
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
        .padding()
    }
}
