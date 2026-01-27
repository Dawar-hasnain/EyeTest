//
//  RingSlice.swift
//  OnlyFriendsApp
//
//  Created by Dawar Hasnain on 27/01/26.
//

struct RingSlice {
    let index: Int
    let startAngle: Double
    let endAngle: Double
}

let customSlices: [RingSlice] = [

    // TOP (3 slices, wider)
    RingSlice(index: 0, startAngle: -45, endAngle: -15),
    RingSlice(index: 1, startAngle: -15, endAngle: 15),
    RingSlice(index: 2, startAngle: 15, endAngle: 45),

    // RIGHT (narrower)
    RingSlice(index: 3, startAngle: 45, endAngle: 90),

    // BOTTOM (3 slices, wider)
    RingSlice(index: 4, startAngle: 90, endAngle: 120),
    RingSlice(index: 5, startAngle: 120, endAngle: 150),
    RingSlice(index: 6, startAngle: 150, endAngle: 180),

    // LEFT (narrower, wraps around)
    RingSlice(index: 7, startAngle: 180, endAngle: 315)
]
