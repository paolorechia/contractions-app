//
//  MiniDashboard.swift
//  Contracoes WatchKit Extension
//
//  Created by Paolo on 03/01/21.
//

import SwiftUI

struct Dashboard: View {
    let recentContractions: Int;
    let averageDuration: Int;
    let averageInterval: Int;

    var body: some View {
        VStack {
            HStack {
                Text("Recent Contractions")
                    .font(.footnote)
                Text(String(recentContractions))
            }
            .padding()
            HStack {
                Text("Average Duration")
                    .font(.footnote)
                Text("\(averageDuration)s")
            }
            .padding()
            HStack {
                Text("Average Interval")
                    .font(.footnote)
                Text("\(averageInterval)m")
            }
            .padding()
        }
        .background(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.10))
        .navigationTitle("Info")
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard(
            recentContractions: 0,
            averageDuration: 0,
            averageInterval: 0
        )
            .previewDevice("Apple Watch Series 5 - 40mm")
    }
}
