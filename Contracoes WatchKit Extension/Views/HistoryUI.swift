//
//  HistoryUI.swift
//  Contracoes WatchKit Extension
//
//  Created by Paolo on 02/01/21.
//

import SwiftUI

struct HistoryUI: View {
    @EnvironmentObject var dataModel: DataModel
    var body: some View {
            List(dataModel.history) { contraction in
                HistoryRowView(formatter: historyDateFormatter(), contraction: contraction)
            }
    }
}

struct HistoryUI_Previews: PreviewProvider {
    static var previews: some View {
        HistoryUI()
    }
}
