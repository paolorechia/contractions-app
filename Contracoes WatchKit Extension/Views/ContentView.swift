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
                    .frame(width: 125, height: 145, alignment: .leading)
                    .font(.caption)
                VStack {
                    NavigationView {
                        NavigationLink(destination: Dashboard()) {
                            Image(systemName: "info.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 100)
                                .background(Color.blue)
                                .cornerRadius(8.0)
                                .offset(x: 0, y: 20)
                        }
                    }
                }
            }
        TimerUI()
            .environmentObject(dataModel)
        }
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
                .previewDevice("Apple Watch Series 6 - 40mm")
                .environmentObject(DataModel())
        }
    }
}
