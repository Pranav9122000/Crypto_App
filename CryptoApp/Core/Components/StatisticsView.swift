//
//  StatisticsView.swift
//  CryptoApp
//
//  Created by Kulkarni, Pranav on 16/07/23.
//

import SwiftUI

struct StatisticsView: View {
    
    let stat: StatisticsModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(stat.title)
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
            Text(stat.value)
                .font(.headline)
                .foregroundColor(Color.theme.accent)
            
            HStack {
                Image(systemName: "triangle.fill")
                    .rotationEffect(Angle(degrees: ((stat.percentageChange ?? 0) >= 0 ? 0 : 180)))
                
                Text(stat.percentageChange?.asPercentString() ?? "")
                    .bold()
            }
            .font(.caption)
            .foregroundColor((stat.percentageChange ?? 0) >= 0 ? Color.theme.green : Color.theme.red)
            .opacity(stat.percentageChange == nil ? 0.0 : 1.0)
        }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StatisticsView(stat: dev.stat1)
                .previewLayout(.sizeThatFits)
            
            StatisticsView(stat: dev.stat2)
                .previewLayout(.sizeThatFits)

            StatisticsView(stat: dev.stat3)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
