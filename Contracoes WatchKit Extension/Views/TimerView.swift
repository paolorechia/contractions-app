//
//  Timer.swift
//  Contracoes WatchKit Extension
//
//  Created by Paolo on 02/01/21.
//

import Foundation
import SwiftUI

struct TimerUI: View {
    @EnvironmentObject var dataModel: DataModel
    @State private var elapsedSeconds: Int = 0
    @State private var isCounting: Bool = false
    @State private var buttonColor: Color = Color.green
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    @State private var startDate: Date? = nil
    @State private var endDate: Date? = nil

    var body: some View {
        HStack {
            Button(action: {
                toggleTimer()
            })
            {
                if !isCounting {
                    Text("Start")
                } else {
                    Text("Stop")
                }
            }
            .background(buttonColor)
            .frame(width: 90, height: 30, alignment: .center)
            .cornerRadius(9)
                        
            Text("\(elapsedSeconds)")
                .font(.title2)
                .onReceive(timer) { time in
                    if isCounting {
                        self.elapsedSeconds += 1
                    }
                }
                .frame(width: 60, height: 30)
        }
    }
    

    private func toggleTimer() {
        self.isCounting = !self.isCounting
        if (self.isCounting) {
            buttonColor = Color.red
            self.elapsedSeconds = 0
            self.startDate = Date()
        } else {
            buttonColor = Color.green
            self.endDate = Date()
            let newContraction = Contraction(
                id: dataModel.currentId.value,
                    start: self.startDate!,
                    end: self.endDate!,
                    durationInSeconds: self.elapsedSeconds
                )
            dataModel.saveContraction(newContraction)
        }
    }
}

struct TimerUI_Previews: PreviewProvider {
    static var previews: some View {
        TimerUI()
    }
}
