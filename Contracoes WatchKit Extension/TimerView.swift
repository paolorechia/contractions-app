//
//  Timer.swift
//  Contracoes WatchKit Extension
//
//  Created by Paolo on 02/01/21.
//

import Foundation
import SwiftUI

struct TimerUI: View {
    @State private var elapsedSeconds: Int = 0
    @State private var isCounting: Bool = false
    @State private var buttonColor: Color = Color.green
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    let dateFormatterPrint = DateFormatter()

    @State private var startDate: Date? = nil
    @State private var endDate: Date? = nil

    var body: some View {
        VStack {
            HStack {
                if startDate != nil {
                    Text(dateFormatterPrint.string(from: startDate!))
                }
                
                if endDate != nil {
                    Text(dateFormatterPrint.string(from: endDate!))
                }
            }


            Text(String(elapsedSeconds))
                .font(.title)
                .onReceive(timer) { time in
                    if isCounting {
                        self.elapsedSeconds += 1
                    }
                }
            Spacer()
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
        }.onAppear(
        perform: initFormatter
        )
    }
    
    private func initFormatter() {
        dateFormatterPrint.dateFormat = "HH:mm:ss"
    }
    
    private func toggleTimer() {
        print("Toggle timer")
        self.isCounting = !self.isCounting
        if (self.isCounting) {
            buttonColor = Color.red
            self.elapsedSeconds = 0
            self.startDate = Date()
        } else {
            buttonColor = Color.green
            self.endDate = Date()
        }
    }
}

struct TimerUI_Previews: PreviewProvider {
    static var previews: some View {
        TimerUI()
    }
}
