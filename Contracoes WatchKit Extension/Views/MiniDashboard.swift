//
//  MiniDashboard.swift
//  Contracoes WatchKit Extension
//
//  Created by Paolo on 03/01/21.
//

import SwiftUI

struct MiniDashboard: View {
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "c.circle.fill")
                Text("3")
            }
            VStack {
                Image(systemName: "d.circle.fill")
                Text("34")
            }
            VStack {
                Image(systemName: "i.circle.fill")
                Text("123")
            }
        }
        .background(Color.blue)
        .cornerRadius(8.0)
    }
}

struct MiniDashboard_Previews: PreviewProvider {
    static var previews: some View {
        MiniDashboard()
            .frame(width: 35, height: 125, alignment: .trailing)
    }
}
