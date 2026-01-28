//
//  LeftAstigmatism.swift
//  EyeTest
//
//  Created by Hafiz Rahmadhani on 23/01/26.
//

import SwiftUI

struct LeftAstigmatism: View {
    //@Binding var isNavigationActive: Bool
    @State private var showAlert = false
    @State private var navigateToRightEye = false
    @State private var isLeftEyeNormal: Bool = false
    @State private var displayManager = DisplayManager()
    
    var body: some View {
        VStack {
            VStack {
                Text("1. Cover your **left** eye.")
                Text("2. Keep your device at **arm's length**.")
                Text("3. Focus on the centre of the semicircle.")
                Text("**Do all the lines look like they are the same shade of black?**")
            }
            .font(.footnote)
            .padding(.bottom, 50)
            .multilineTextAlignment(.center)
            
            Image("FanChart")
                .resizable()
                .scaledToFit()
                .frame(width: 378, height: 234)
            
            Spacer()
            
            HStack(spacing: 20) {
                Button(action: {
                    isLeftEyeNormal = true
                    navigateToRightEye = true
                }) {
                    Text("Yes")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Button(action: {
                    isLeftEyeNormal = false
                    navigateToRightEye = true
                }) {
                    Text("No")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $navigateToRightEye) {
            RightEye(
                //isNavigationActive: $isNavigationActive,
                leftEyeResult: isLeftEyeNormal
            )
        }
        .task {
            displayManager.lockMaxBrightness()
            showAlert = true
        }
        .onDisappear {
            displayManager.restoreSettings()
        }
        .alert("Important Setup", isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Step 1: Brightness has been set to Max. \nPlease manually turn off 'True Tone' in Control Center for accurate results.\n\nStep 2: Holding a phone of approximately 20cm from your eyes would give you nearly accurate results.")
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    NavigationStack {
        LeftAstigmatism()
    }
}
