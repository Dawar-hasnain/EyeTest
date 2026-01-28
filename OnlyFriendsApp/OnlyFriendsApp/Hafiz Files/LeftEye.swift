//
//  LeftEye.swift
//  EyeTest
//
//  Created by Hafiz Rahmadhani on 22/01/26.
//

import SwiftUI

struct LeftEye: View {
    //@Binding var isNavigationActive: Bool
    @State private var navigateToLeftAstigmatism = false
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 30) {
                VStack {
                    Image(systemName: "eye.slash.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.gray)
                    Text("Left")
                        .font(.caption)
                        .foregroundColor(.secondary)
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
            
            Text("Cover Your Left Eye")
                .font(.title2)
                .fontWeight(.bold)
                .padding()
            
            Button(action: {
                navigateToLeftAstigmatism = true
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
        .navigationDestination(isPresented: $navigateToLeftAstigmatism) {
            LeftAstigmatism()
        }
    }
}

#Preview {
    NavigationStack {
        LeftEye()
    }
}
