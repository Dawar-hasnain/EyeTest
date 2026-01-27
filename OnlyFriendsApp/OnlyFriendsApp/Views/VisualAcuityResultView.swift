//
//  VisualAcuityResultView.swift
//  OnlyFriendsApp
//
//  Created by Dawar Hasnain on 26/01/26.
//

import SwiftUI

struct VisualAcuityResultView: View {

    let result: VisualAcuityResult
    let onRetest: () -> Void
    let onExit: () -> Void

    var body: some View {
        VStack(spacing: 32) {

            // Title
            Text("Test Result")
                .font(.largeTitle)
                .fontWeight(.bold)

            // Vision Score
            VStack(spacing: 8) {
                Text(result.displayText)
                    .font(.system(size: 64, weight: .bold))

                Text("Visual Acuity")
                    .font(.headline)
                    .foregroundColor(.gray)
            }

            Divider()

//            // Confidence
//            VStack(spacing: 6) {
//                Text(result.confidenceText)
//                    .font(.headline)
//
////                Text(result.confidenceDescription)
////                    .font(.body)
////                    .multilineTextAlignment(.center)
////                    .foregroundColor(.gray)
//            }
//            .padding(.horizontal)

            Spacer()

            // Actions
            VStack(spacing: 12) {
                Button(action: onRetest) {
                    Text("Retest")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(14)
                }

                Button(action: onExit) {
                    Text("Done")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.black)
                }
            }
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
}
