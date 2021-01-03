//
//  ContentView.swift
//  Contracoes WatchKit Extension
//
//  Created by Paolo on 02/01/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataModel: DataModel;
    var body: some View {
        VStack {
            HStack {
                HistoryUI()
                    .environmentObject(dataModel)
                    .frame(width: 115, height: 180, alignment: .leading)
                    .font(.caption)
            }
            TimerUI()
                .environmentObject(dataModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DataModel())
    }
}
