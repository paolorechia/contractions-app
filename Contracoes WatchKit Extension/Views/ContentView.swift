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
                        .frame(width: 130, height: 135, alignment: .leading)
                        .font(.caption)
                    VStack {
                        NavigationLink(
                            destination: Dashboard(
                                recentContractions: dataModel.recentContractions,
                                averageDuration: dataModel.averageDuration,
                                averageInterval: dataModel.averageInterval)
                        )
                         {
                                MiniDashboard(
                                    recentContractions: dataModel.recentContractions,
                                    averageDuration: dataModel.averageDuration,
                                    averageInterval: dataModel.averageInterval)
                                    .frame(width: 30, height: 115)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                TimerUI()
                    .environmentObject(dataModel)
            }
        }
        .navigationTitle("Contractions")
        .alert(isPresented: $dataModel.showAlert) {
            Alert(
            title: Text("You are in active labour!"),
            message: Text("Go to the hospital!"),
            dismissButton: .default(Text("OK")))
        }
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
