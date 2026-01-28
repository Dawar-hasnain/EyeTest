//
//  SmallLandoltCView.swift
//  OnlyFriendsApp
//
//  Created by Dawar Hasnain on 26/01/26.
//

import SwiftUI

struct SmallLandoltCView: View {
    let rotationAngle: Double
    let size: CGFloat
    
    var body: some View {
        Image("landolt_small")
            .resizable()
            .scaledToFit()
            .frame(width: size, height: size)
            .rotationEffect(.degrees(rotationAngle))
            .accessibilityLabel("Landolt C")
    }
}
