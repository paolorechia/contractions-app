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
            HStack {
                Image(systemName: "sum")
                Text("3")
            }
            .padding()
            VStack {
                Image(systemName: "minus.circle")
                Text("34")
            }
            .padding()
            VStack {
                Image(systemName: "divide.circle")
                Text("123")
            }
            .padding()
        }
        .background(Color.blue)
    }
}

struct MiniDashboard_Previews: PreviewProvider {
    static var previews: some View {
        MiniDashboard()
            .frame(width: 35, height: 125, alignment: .trailing)
    }
}
