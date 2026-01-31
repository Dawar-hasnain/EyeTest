//
//  ProfilePrescriptionsView.swift
//  OnlyFriendsApp
//
//  Created by Dawar Hasnain on 30/01/26.
//

import SwiftUI

struct ProfilePrescriptionsView: View {

    let hasMyopia: Bool
    let hasColorBlindness: Bool
    let hasAstigmatism: Bool

    @Binding var myopiaPrescription: String
    @Binding var colorBlindnessType: String
    @Binding var astigmatismPrescription: String

    let onFinish: () -> Void

    var body: some View {
        Form {

            if hasMyopia {
                Section(header: Text("Myopia")) {
                    TextField("Prescription (or Not sure)", text: $myopiaPrescription)
                }
            }

            if hasColorBlindness {
                Section(header: Text("Color Blindness")) {
                    TextField("Type (or Not sure)", text: $colorBlindnessType)
                }
            }

            if hasAstigmatism {
                Section(header: Text("Astigmatism")) {
                    TextField("Prescription (or Not sure)", text: $astigmatismPrescription)
                }
            }

            Section {
                Button("Finish Setup") {
                    onFinish()
                }
            }
        }
        .navigationTitle("Additional Info")
    }
}
