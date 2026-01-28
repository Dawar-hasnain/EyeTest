//
//  RightAstigmatism.swift
//  EyeTest
//
//  Created by Hafiz Rahmadhani on 23/01/26.
//

import SwiftUI

struct RightAstigmatism: View {
    //@Binding var isNavigationActive: Bool
    let leftEyeResult: Bool
    
    @State private var isRightEyeNormal: Bool = false
    @State private var navigateToSummary = false
    @State private var showAlert = false
    @State private var displayManager = DisplayManager()
    
    @Environment(\.dismiss) private var dismiss
    
    let onDone: () -> Void
    
    var body: some View {
        VStack {
            VStack(spacing: 8) {
                Text("1. Cover your **right** eye.")
                Text("2. Keep your device at **arm's length**.")
                Text("3. Focus on the centre of the semicircle.")
                Text("**Do all the lines look like they are the same shade of black?**")
                    .padding(.top, 10)
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
                    isRightEyeNormal = true
                    navigateToSummary = true
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
                    isRightEyeNormal = false
                    navigateToSummary = true
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
        .navigationDestination(isPresented: $navigateToSummary) {
            SummaryAstigmatism(leftResult: leftEyeResult, rightResult: isRightEyeNormal, onDone: {
                dismiss()
            })
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

//#Preview {
//    NavigationStack {
//        RightAstigmatism(
//            //isNavigationActive: .constant(true),
//            leftEyeResult: true,
//            onDone: {
//                dismiss()
//            }
//        )
//    }
//}
