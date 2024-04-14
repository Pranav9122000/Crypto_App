//
//  String.swift
//  CryptoApp
//
//  Created by Kulkarni, Pranav on 20/07/23.
//

import Foundation

extension String {
    
    var removingHTMLStrings: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
