//
//  ProfileNameView.swift
//  OnlyFriendsApp
//
//  Created by Dawar Hasnain on 30/01/26.
//

import SwiftUI

struct ProfileNameView: View {

    @Binding var name: String
    let onNext: () -> Void

    var body: some View {
        VStack(spacing: 24) {

            Spacer()

            Text("Welcome")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Let’s set up your eye health profile")
                .foregroundColor(.secondary)

            TextField("Your name", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            Spacer()

            Button("Continue") {
                onNext()
            }
            .buttonStyle(.borderedProminent)
            .disabled(name.trimmingCharacters(in: .whitespaces).isEmpty)
            .padding()
        }
        .padding()
    }
}
