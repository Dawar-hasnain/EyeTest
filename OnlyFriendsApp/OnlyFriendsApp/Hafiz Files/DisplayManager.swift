//
//  DisplayManager.swift
//  EyeTest
//
//  Created by Hafiz Rahmadhani on 26/01/26.
//

import Foundation
import SwiftUI
import UIKit

@Observable
class DisplayManager {
    private var originalBrightness: CGFloat = 0.5
    
    // Mencari screen melalui WindowScene yang aktif (Standard iOS 26)
    private var activeScreen: UIScreen? {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first { $0.activationState == .foregroundActive } as? UIWindowScene
        return windowScene?.screen
    }

    func lockMaxBrightness() {
        // Ambil instance screen secara spesifik
        guard let screen = activeScreen else { return }
        
        // Simpan nilai lama
        self.originalBrightness = screen.brightness
        
        // Set ke maksimal langsung pada instance screen tersebut
        screen.brightness = 1.0
        
        // Mencegah layar mati otomatis selama tes
        UIApplication.shared.isIdleTimerDisabled = true
    }

    func restoreSettings() {
        guard let screen = activeScreen else { return }
        
        // Kembalikan ke nilai awal
        screen.brightness = originalBrightness
        
        // Aktifkan kembali penguncian layar otomatis
        UIApplication.shared.isIdleTimerDisabled = false
    }
}
