//
//  HistoryFormatter.swift
//  Contracoes WatchKit Extension
//
//  Created by Paolo on 02/01/21.
//

import Foundation

func historyDateFormatter() -> DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm:ss"
    return formatter
}
