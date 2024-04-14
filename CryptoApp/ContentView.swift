//
//  ContentView.swift
//  CryptoApp
//
//  Created by Kulkarni, Pranav on 13/07/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                Text("Accent")
                    .foregroundColor(Color.theme.accent)
                Text("Red")
                    .foregroundColor(Color.theme.red)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
