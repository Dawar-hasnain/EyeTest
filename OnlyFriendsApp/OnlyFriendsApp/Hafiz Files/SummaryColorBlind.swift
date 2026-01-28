//
//  SummaryColorBlind.swift
//  EyeTest
//
//  Created by Hafiz Rahmadhani on 25/01/26.
//

import SwiftUI

struct SummaryColorBlind: View {
    let totalCorrect: Int
    let totalQuestions: Int
    
    @Environment(\.dismiss) private var dismiss
    //@Binding var isNavigationActive: Bool
    @State private var navigateToLeftEye = false
    let onDone: () -> Void
    
    var isNormal: Bool {
        return totalCorrect >= 5
    }
    
    var body: some View {
        VStack(spacing: 25) {
            Spacer()
            ZStack {
                Circle()
                    .stroke(isNormal ? Color.green.opacity(0.2) : Color.orange.opacity(0.2), lineWidth: 15)
                    .frame(width: 150, height: 150)
                
                VStack {
                    Text("\(totalCorrect)/\(totalQuestions)")
                        .font(.system(size: 40, weight: .bold))
                    Text("Correct")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            
            Text(isNormal ? "Normal Vision" : "Vision Insight")
                .font(.largeTitle)
                .bold()
            
            Text(isNormal ?
                 "Excellent! You have a strong ability to distinguish color patterns." :
                 "You missed several plates. This might indicate color vision deficiency. We suggest visiting an eye specialist.")
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
                .foregroundColor(.secondary)
            
            Spacer()
            
            Button(action: {
                navigateToLeftEye = true
            }) {
                Text("Next: Astigmatism Check ")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.horizontal, 40)
            
            Button(action: {
                //isNavigationActive = false
                onDone()
            }) {
                Text("Back to Home")
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
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $navigateToLeftEye) {
            LeftEye()
        }
    }
}

//#Preview {
//    SummaryColorBlind(totalCorrect: 4, totalQuestions: 6, onDone: {
//        dismiss()
//    })
//}
