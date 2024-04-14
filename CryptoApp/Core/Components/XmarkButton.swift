//
//  XmarkButton.swift
//  CryptoApp
//
//  Created by Kulkarni, Pranav on 17/07/23.
//

import SwiftUI

struct XmarkButton: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "xmark")
                .font(.headline)
        }
        .padding()
    }
}

struct XmarkButton_Previews: PreviewProvider {
    static var previews: some View {
        XmarkButton()
    }
}
