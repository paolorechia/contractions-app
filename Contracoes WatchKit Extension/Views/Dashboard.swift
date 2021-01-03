//
//  MiniDashboard.swift
//  Contracoes WatchKit Extension
//
//  Created by Paolo on 03/01/21.
//

import SwiftUI

struct Dashboard: View {
    var body: some View {
        VStack {
            HStack {
                Text("Recent Contractions")
                    .font(.footnote)
                Text("3")
            }
            .padding()
            HStack {
                Text("Average Duration")
                    .font(.footnote)

                Text("34")
            }
            .padding()
            HStack {
                Text("Average Interval")
                    .font(.footnote)
                Text("123")
            }
            .padding()
        }
        .background(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.10))
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
            .previewDevice("Apple Watch Series 5 - 40mm")
    }
}
