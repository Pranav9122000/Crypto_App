//
//  UIApplication.swift
//  CryptoApp
//
//  Created by Kulkarni, Pranav on 14/07/23.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
