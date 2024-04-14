//
//  HapticManager.swift
//  CryptoApp
//
//  Created by Kulkarni, Pranav on 18/07/23.
//

import Foundation
import SwiftUI

class HapticManager {
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
