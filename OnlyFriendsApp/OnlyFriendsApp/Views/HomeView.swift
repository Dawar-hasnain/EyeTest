//
//  FinalVisualAcuitySummaryView.swift
//  OnlyFriendsApp
//
//  Created by Dawar Hasnain on 27/01/26.
//

//
//  HomeView.swift
//  OnlyFriendsApp
//
//  Created by Dawar Hasnain on 27/01/26.
//

import SwiftUI

struct HomeView: View {

    // 🔑 Load user profile once
    private let profile = UserProfileManager.shared.loadProfile()
    let onResetProfile: () -> Void

    @State private var showResetConfirmation = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 60) {

                    // MARK: - Profile Greeting
                    VStack(alignment: .leading, spacing: 6) {

                        Text(
                            "Hello\(profile?.name.isEmpty == false ? ", \(profile!.name)" : "")"
                        )
                        .font(.largeTitle)
                        .fontWeight(.bold)

                        Text("Let’s check your eye health today")
                            .foregroundColor(.secondary)
                    }
                    .padding(.top, 20)

                    // MARK: - Profile Summary Card
                    if let profile {
                        VStack(alignment: .leading, spacing: 12) {

                            ProfileSummaryCardView(profile: profile)

                            // MARK: - Reset Profile Button
                            Button(role: .destructive) {
                                showResetConfirmation = true
                            } label: {
                                Label("Reset Profile", systemImage: "arrow.counterclockwise")
                                    .font(.subheadline)
                            }
                            .confirmationDialog(
                                "Reset Profile?",
                                isPresented: $showResetConfirmation,
                                titleVisibility: .visible
                            ) {
                                Button("Reset and Start Fresh", role: .destructive) {
                                    UserProfileManager.shared.resetProfile()
                                    onResetProfile()
                                }

                                Button("Cancel", role: .cancel) {}
                            } message: {
                                Text(
                                    "This will erase your profile and prior test context. The app will start fresh the next time you open it."
                                )
                            }
                        }
                    }

                    // MARK: - Test Cards
                    VStack(spacing: 20) {

                        NavigationLink(value: EyeTestType.visualAcuity) {
                            TestCard(
                                icon: "eye",
                                title: "Visual Acuity Test",
                                subtitle: "Measure sharpness of vision"
                            )
                        }

                        NavigationLink(value: EyeTestType.colorContrast) {
                            TestCard(
                                icon: "circle.lefthalf.filled",
                                title: "Color Contrast Test",
                                subtitle: "Detect contrast sensitivity"
                            )
                        }

                        NavigationLink(value: EyeTestType.colorBlindness) {
                            TestCard(
                                icon: "paintpalette",
                                title: "Color Blindness Test",
                                subtitle: "Identify color perception"
                            )
                        }

                        NavigationLink(value: EyeTestType.astigmatism) {
                            TestCard(
                                icon: "circle.grid.cross",
                                title: "Astigmatism Test",
                                subtitle: "Check distortion or blur"
                            )
                        }
                    }

                    Spacer()
                }
                .padding(.horizontal, 20)
            }
            .navigationDestination(for: EyeTestType.self) { testType in
                switch testType {
                case .visualAcuity:
                    VisualAcuityFlowView()

                case .colorContrast:
                    ColorContrastFlowView()

                case .colorBlindness:
                    ColorBlind()

                case .astigmatism:
                    LeftEye()

                default:
                    EmptyView()
                }
            }
        }
    }
}

//#Preview {
//    HomeView()
//}
