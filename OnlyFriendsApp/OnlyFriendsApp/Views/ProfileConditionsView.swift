//
//  ProfileConditionsView.swift
//  OnlyFriendsApp
//
//  Created by Dawar Hasnain on 30/01/26.
//

import SwiftUI

struct ProfileConditionsView: View {

    @Binding var hasMyopia: Bool
    @Binding var hasColorBlindness: Bool
    @Binding var hasAstigmatism: Bool

    let onNext: () -> Void

    var body: some View {
        Form {

            Section(
                header: Text("Known Eye Conditions"),
                footer: Text("Select any conditions you have already been diagnosed with.")
            ) {
                Toggle("Myopia (Near-sightedness)", isOn: $hasMyopia)
                Toggle("Color Blindness", isOn: $hasColorBlindness)
                Toggle("Astigmatism", isOn: $hasAstigmatism)
            }

            Section {
                Button("Continue") {
                    onNext()
                }
            }
        }
        .navigationTitle("Eye Health")
    }
}
