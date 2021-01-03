//
//  Contracoes.swift
//  Contracoes WatchKit Extension
//
//  Created by Paolo on 02/01/21.
//

import Foundation

struct Contraction: Decodable, Identifiable {
    var id: Int
    var start: Date
    var end: Date
    var durationInSeconds: Int
}
