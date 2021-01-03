//
//  MiniDashboard.swift
//  Contracoes WatchKit Extension
//
//  Created by Paolo on 03/01/21.
//

import SwiftUI

struct MiniDashboard: View {
    var recentContractions: Int
    var averageDuration: Int
    var averageInterval: Int

    var body: some View {
        VStack {
            VStack {
                Image(systemName: "c.circle.fill")
                Text(String(recentContractions))
            }
            VStack {
                Image(systemName: "d.circle.fill")
                Text(String(averageDuration))
            }
            VStack {
                Image(systemName: "i.circle.fill")
                Text(String(averageInterval))
            }
        }
        .background(Color.blue)
        .cornerRadius(8.0)
    }
}

struct MiniDashboard_Previews: PreviewProvider {
    static var previews: some View {
        MiniDashboard(
            recentContractions: 0,
            averageDuration: 0,
            averageInterval: 0
        )
            .frame(width: 35, height: 125, alignment: .trailing)
    }
}
