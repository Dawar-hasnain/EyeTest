//
//  ProfileOnboardingView.swift
//  OnlyFriendsApp
//
//  Created by Dawar Hasnain on 30/01/26.
//

import SwiftUI

struct ProfileOnboardingFlowView: View {

    enum Step {
        case name
        case conditions
        case prescriptions
    }

    @State private var step: Step = .name

    // Collected data
    @State private var name: String = ""

    @State private var hasMyopia = false
    @State private var hasColorBlindness = false
    @State private var hasAstigmatism = false

    @State private var myopiaPrescription: String = ""
    @State private var colorBlindnessType: String = ""
    @State private var astigmatismPrescription: String = ""

    let onFinish: () -> Void

    var body: some View {
        NavigationStack {
            switch step {

            case .name:
                ProfileNameView(
                    name: $name,
                    onNext: { step = .conditions }
                )

            case .conditions:
                ProfileConditionsView(
                    hasMyopia: $hasMyopia,
                    hasColorBlindness: $hasColorBlindness,
                    hasAstigmatism: $hasAstigmatism,
                    onNext: { step = .prescriptions }
                )

            case .prescriptions:
                ProfilePrescriptionsView(
                    hasMyopia: hasMyopia,
                    hasColorBlindness: hasColorBlindness,
                    hasAstigmatism: hasAstigmatism,
                    myopiaPrescription: $myopiaPrescription,
                    colorBlindnessType: $colorBlindnessType,
                    astigmatismPrescription: $astigmatismPrescription,
                    onFinish: saveProfile
                )
            }
        }
    }

    // MARK: - Save Profile
    private func saveProfile() {
        let profile = UserProfile(
            name: name,
            hasMyopia: hasMyopia,
            hasColorBlindness: hasColorBlindness,
            hasAstigmatism: hasAstigmatism,
            myopiaPrescription: hasMyopia ? myopiaPrescription : nil,
            colorBlindnessType: hasColorBlindness ? colorBlindnessType : nil,
            astigmatismPrescription: hasAstigmatism ? astigmatismPrescription : nil
        )

        UserProfileManager.shared.saveProfile(profile)
        onFinish()
    }
}
