//
//  ClickableRingView.swift
//  OnlyFriendsApp
//
//  Created by Dawar Hasnain on 26/01/26.
//

import SwiftUI

struct ClickableRingView: View {
    let onSegmentTap: (Int) -> Void
    let questionIndex: Int
    @State private var selectedIndex: Int? = nil
    let ringAngleOffset: Double = 22 // degrees
    
    let segmentCount = 8
    
    var body: some View {
        ZStack{
            ForEach(0..<segmentCount, id: \.self)
            {
                index in
                let startAngle = Angle(degrees: Double(index) * 45 - 90 + ringAngleOffset)
                let endAngle = Angle(degrees: Double(index + 1) * 45 - 90 + ringAngleOffset)
                
                RingSegmentShape(
                    startAngle: startAngle,
                    endAngle: endAngle
                )
                .fill(
                    selectedIndex == index ? Color.white: Color.black
                )
                .animation(.easeInOut(duration: 0.1), value: selectedIndex)
                .overlay(
                    RingSegmentShape(
                        startAngle: startAngle,
                        endAngle: endAngle
                    )
                    .stroke(Color.white, lineWidth: 2)
                )
                .contentShape(RingSegmentShape(startAngle: startAngle, endAngle: endAngle))
                .onTapGesture {
                    selectedIndex = index
                    onSegmentTap(index)
                    print("Tapped segment:", index)
                }
            }
        }
        .frame(width: 280, height: 280)
        .accessibilityHidden(true)
        .onChange(of: questionIndex) { oldValue, newValue in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                withAnimation(.easeInOut(duration: 0.2)) {
                    selectedIndex = nil
                }
            }
        }
    }
}

#Preview {
    ClickableRingView(onSegmentTap: { index in}, questionIndex: 0)
}
