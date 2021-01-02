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

    var body: some View {
        VStack {
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
        }
    }
    
    private func toggleTimer() {
        print("Toggle timer")
        self.isCounting = !self.isCounting
        if (self.isCounting) {
            buttonColor = Color.red
            self.elapsedSeconds = 0
        } else {
            buttonColor = Color.green
        }
    }
}

struct TimerUI_Previews: PreviewProvider {
    static var previews: some View {
        TimerUI()
    }
}
