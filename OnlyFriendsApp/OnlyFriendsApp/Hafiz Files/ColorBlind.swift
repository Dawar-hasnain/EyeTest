//
//  ColorBlind.swift
//  EyeTest
//
//  Created by Hafiz Rahmadhani on 25/01/26.
//

import SwiftUI

struct ColorBlind: View {
    //@Binding var isNavigationActive: Bool
    @State private var navigateToColorBlindTest = false
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 30) {
                VStack {
                    Image(systemName: "eye.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.blue)
                    Text("Left")
                        .font(.caption)
                }
                VStack {
                    Image(systemName: "eye.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.blue)
                    Text("Right")
                        .font(.caption)
                }
            }
            .padding()
            
            Text("Keep both eyes open.")
                .font(.headline)
                .padding()
            
            Button(action: {
                navigateToColorBlindTest = true
            }) {
                Text("Next")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 30)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(isPresented: $navigateToColorBlindTest) {
//            ColorBlindTest(isNavigationActive: $isNavigationActive)
            ColorBlindTest()
        }
    }
}

#Preview {
    NavigationStack {
        ColorBlind()
    }
}
