//
//  SummaryAstigmatism.swift
//  EyeTest
//
//  Created by Hafiz Rahmadhani on 25/01/26.
//

import SwiftUI

struct SummaryAstigmatism: View {
    
    let leftResult: Bool
    let rightResult: Bool
    //@Binding var isNavigationActive: Bool
    let onDone: () -> Void
    
    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 80))
                .foregroundColor(.green)
                .padding(.top, 40)
            
            Text("Test Completed!")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            VStack(spacing: 15) {
                ResultCard(eyeName: "Left Eye", isNormal: rightResult)
                ResultCard(eyeName: "Right Eye", isNormal: leftResult)
            }
            .padding(.horizontal)
            
            Text("Note: This test is for screening purposes only and does not replace a professional eye exam.")
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
            Spacer()
            
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
    }
}

struct ResultCard: View {
    let eyeName: String
    let isNormal: Bool
    
    var body: some View {
        HStack {
            Text(eyeName)
                .font(.headline)
            Spacer()
            HStack {
                Text(isNormal ? "Normal" : "Indication of Astigmatism")
                    .font(.subheadline)
                    .fontWeight(.bold)
                Image(systemName: isNormal ? "checkmark.seal.fill" : "exclamationmark.triangle.fill")
            }
            .foregroundColor(isNormal ? .green : .orange)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}

//#Preview {
//    SummaryAstigmatism(leftResult: true, rightResult: false, isNavigationActive: .constant(true))
//}
