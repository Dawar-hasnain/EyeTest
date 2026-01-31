//
//  UserProfile.swift
//  OnlyFriendsApp
//
//  Created by Dawar Hasnain on 30/01/26.
//

import Foundation

struct UserProfile: Codable {

    // MARK: - Basic Info
    let name: String

    // MARK: - Known Conditions
    let hasMyopia: Bool
    let hasColorBlindness: Bool
    let hasAstigmatism: Bool

    // MARK: - Prescribed / Known Values (Optional)
    let myopiaPrescription: String?
    let colorBlindnessType: String?
    let astigmatismPrescription: String?
}
