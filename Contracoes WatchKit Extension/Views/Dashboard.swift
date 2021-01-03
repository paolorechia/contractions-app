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
                Text("Count (last hour):")
                Text("3")
            }
            .padding()
            HStack {
                Text("Average Duration:")
                Text("34")
            }
            .padding()
            HStack {
                Text("")
                Text("123")
            }
            .padding()
        }
        .background(Color.blue)

    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
