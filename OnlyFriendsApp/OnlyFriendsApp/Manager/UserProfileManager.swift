//
//  UserProfileManager.swift
//  OnlyFriendsApp
//
//  Created by Dawar Hasnain on 30/01/26.
//

import Foundation

final class UserProfileManager {

    static let shared = UserProfileManager()

    private let profileKey = "UserProfileKey"
    private let onboardingKey = "HasCompletedOnboarding"

    private init() {}

    // MARK: - Save Profile
    func saveProfile(_ profile: UserProfile) {
        do {
            let data = try JSONEncoder().encode(profile)
            UserDefaults.standard.set(data, forKey: profileKey)
            UserDefaults.standard.set(true, forKey: onboardingKey)
        } catch {
            print("❌ Failed to save user profile:", error)
        }
    }

    // MARK: - Load Profile
    func loadProfile() -> UserProfile? {
        guard let data = UserDefaults.standard.data(forKey: profileKey) else {
            return nil
        }

        do {
            return try JSONDecoder().decode(UserProfile.self, from: data)
        } catch {
            print("❌ Failed to load user profile:", error)
            return nil
        }
    }

    // MARK: - Profile Existence
    var hasProfile: Bool {
        loadProfile() != nil
    }

    // MARK: - Onboarding State
    var hasCompletedOnboarding: Bool {
        UserDefaults.standard.bool(forKey: onboardingKey)
    }

    // MARK: - Reset Profile 🔥
    func resetProfile() {
        UserDefaults.standard.removeObject(forKey: profileKey)
        UserDefaults.standard.removeObject(forKey: onboardingKey)
        UserDefaults.standard.synchronize()
    }
}
