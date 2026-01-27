//
//  LandoltRotationDemoView.swift
//  OnlyFriendsApp
//
//  Created by Dawar Hasnain on 26/01/26.
//

import SwiftUI

struct LandoltRotationDemoView: View {
    @State private var manager = LandoltRotationManager()
    
    var body: some View {
        VStack(spacing: 25)
        {
            SmallLandoltCView(rotationAngle: manager.rotationAngle, size: 60)
            
            Button("Randomize")
            {
                manager.randomize()
                print("Expected segment:", manager.expectedSegmentIndex)
            }
        }
        .onAppear {
            manager.randomize()
        }
    }
}
