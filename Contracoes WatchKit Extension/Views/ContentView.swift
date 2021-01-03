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
            HistoryUI()
                .environmentObject(dataModel)
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
