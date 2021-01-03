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
            VStack {
                Text("Average duration of last 3 contractions")
                    .font(.footnote)
                Spacer()
                Text("\(averageDuration) seconds")
                
            }
            .padding()
            VStack {
                Text("Average Interval")
                    .font(.footnote)
                Text("\(averageInterval) minutes")
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
