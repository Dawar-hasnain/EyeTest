//
//  ContentView.swift
//  OnlyFriendsApp
//
//  Created by Dawar Hasnain on 25/01/26.
//

import SwiftUI

struct ContentView: View {

    @State private var hasProfile =
        UserProfileManager.shared.hasCompletedOnboarding

    var body: some View {
        if hasProfile {
            HomeView(onResetProfile: {
                hasProfile = false
            })
        } else {
            ProfileOnboardingFlowView {
                hasProfile = true
            }
        }
    }
}
