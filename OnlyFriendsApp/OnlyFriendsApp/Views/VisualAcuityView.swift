//
//  VisualAcuityView.swift
//  OnlyFriendsApp
//
//  Created by Dawar Hasnain on 26/01/26.
//

import SwiftUI

struct VisualAcuityView: View {
    var body: some View {
        VStack (spacing: 32) {
            
            VStack (spacing: 10) {
                Text("Visual Acuity Test")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Cover one eye and hold your phone at arm's length.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
            }
            
            Divider()
            
            VStack (spacing: 32) {
                Text("E")
                    .font(.system(size: 120, weight: .bold))
                    .foregroundColor(.black)
                    .accessibilityHidden(true)
            }
            .frame(maxWidth: .infinity, maxHeight: 200)
            
            Divider()
            
            Button(action: {
                
            }) {
                Text("Start Test")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(16)
            }
            .padding(.horizontal)
            
            Spacer()
            
        }
        .padding()
        .navigationTitle(Text("Visual Acuity"))
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.white)
    }
}
