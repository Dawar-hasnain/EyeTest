//
//  RingSegmentShape.swift
//  OnlyFriendsApp
//
//  Created by Dawar Hasnain on 26/01/26.
//

import SwiftUI

struct RingSegmentShape: Shape{
    let startAngle: Angle
    let endAngle: Angle
    let innerRadiusRatio: CGFloat = 0.6
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let outerRadius = min(rect.width, rect.height)/2
        let innerRadius = outerRadius * innerRadiusRatio
        
        var path = Path()
        
        path.addArc(
            center: center,
            radius: outerRadius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: false
        )
        
        path.addArc(
            center: center,
            radius: innerRadius,
            startAngle: endAngle,
            endAngle: startAngle,
            clockwise: true
        )
        
        path.closeSubpath()
        return path
    }
}
