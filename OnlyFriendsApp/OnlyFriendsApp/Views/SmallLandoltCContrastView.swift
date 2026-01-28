//
//  SmallLandoltCContrastView.swift
//  OnlyFriendsApp
//
//  Created by Dawar Hasnain on 28/01/26.
//

import SwiftUI

struct SmallLandoltCContrastView: View {

    let rotationAngle: Double
    let size: CGFloat
    let contrast: CGFloat   // 0–100

    private var opacityValue: Double {
        Double(contrast / 100)
    }

    var body: some View {
        Image("landolt_small")
            .resizable()
            .scaledToFit()
            .frame(width: size, height: size)
            .rotationEffect(.degrees(rotationAngle))
            .opacity(opacityValue)
            .animation(.easeInOut(duration: 0.15), value: size)
            .animation(.easeInOut(duration: 0.15), value: contrast)
            .accessibilityLabel("Landolt C")
    }
}
