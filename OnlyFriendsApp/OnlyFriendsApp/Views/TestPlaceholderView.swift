//
//  TestPlaceholderView.swift
//  OnlyFriendsApp
//
//  Created by Dawar Hasnain on 26/01/26.
//

import SwiftUI

struct TestPlaceholderView: View {
    let testType: EyeTestType
    
    var title: String{
        switch testType {
        case .visualAcuity:
            return "Visual Acuity Test"
            
        case .colorContrast:
            return "Color Contrast Test"
            
        case .colorBlindness:
            return "Color Blindness Test"
            
        case .astigmatism:
            return "Astigmatism Test"
        }
    }
    
    var body: some View {
        VStack{
            Spacer()
            
            Text (title)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Coming Soon")
                .font(.headline)
                .foregroundColor(.gray)
                .padding(.top, 8)
            
            Spacer()
        }
            .padding()
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.white)
    }
    
}

//#Preview {
//    TestPlaceholderView()
//}
