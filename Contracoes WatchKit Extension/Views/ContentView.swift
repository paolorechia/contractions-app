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
        NavigationView {
            VStack {
                HStack {
                    HistoryUI()
                        .environmentObject(dataModel)
                        .frame(width: 115, height: 135, alignment: .leading)
                        .font(.caption)
                    VStack {
                            NavigationLink(destination: Dashboard()) {
                                    MiniDashboard()
                                        .frame(width: 35, height: 135)
                            }
                        }
                    }
                }
            TimerUI()
                .environmentObject(dataModel)
        }
        .navigationViewStyle(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Navigation View Style@*/DefaultNavigationViewStyle()/*@END_MENU_TOKEN@*/)
    }
    func placeholder() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environmentObject(DataModel())
            ContentView()
                .previewDevice("Apple Watch Series 5 - 40mm")
                .environmentObject(DataModel())
        }
    }
}
