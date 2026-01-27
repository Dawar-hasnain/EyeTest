//
//  TestCard.swift
//  OnlyFriendsApp
//
//  Created by Dawar Hasnain on 26/01/26.
//

import Foundation
import SwiftUI

struct TestCard: View {
    let icon: String
    let title: String
    let subtitle: String
    
    var body: some View {
        HStack(spacing: 16){
            Image(systemName: icon)
                .font(.system(size: 28))
                .frame(width: 40)
                .foregroundColor(.black)
            
            VStack (alignment: .leading, spacing: 4){
                Text(title)
                    .font(.headline)
                    .foregroundColor(.black)
                
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.black.opacity(0.1), lineWidth: 1)
        )
        .contentShape(Rectangle())
    }
}
