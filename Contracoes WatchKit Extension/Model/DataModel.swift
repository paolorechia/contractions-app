//
//  DataModel.swift
//  Contracoes WatchKit Extension
//
//  Created by Paolo on 02/01/21.
//

import Foundation
import Combine

final class DataModel: ObservableObject {
    static let TIME_FILTER_IN_SECONDS: Double = 60 * 60 * 30
    
    @Published var history: [Contraction] = load("history.json")
    @Published var currentId: CurrentId = load("currentId.json")
    
    @Published var recentHistory: [Contraction] = []
    @Published var recentContractions: Int = 0
    @Published var averageDuration: Int = 0
    @Published var averageInterval: Int = 0

    func saveContraction(_ contraction: Contraction) {
        history.append(contraction)
        currentId.value += 1
        saveArray("history.json", history: history)
        saveObject("currentId.json", currentId: currentId)
    }
    
    func updateDash() {
        let now = Date()
        var totalDuration = 0
        var recentHistory: [Contraction] = []
        for hist in history {
            let timeDifferenceInSeconds = abs(hist.start.timeIntervalSince(now))
            if (timeDifferenceInSeconds < DataModel.TIME_FILTER_IN_SECONDS) {
                totalDuration += hist.durationInSeconds
                recentHistory.append(hist)
            }
        }
        recentContractions = recentHistory.count
        averageDuration = totalDuration / recentContractions
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find bundle with \(filename)")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


func saveArray<T: Codable>(_ filename: String, history: [T]) {
    var data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find bundle with \(filename)")
    }

    do {
        data = try JSONEncoder().encode(history)
    } catch {
        fatalError("NOOOO")
    }

    do {
        try data.write(to: file)
    } catch {
        fatalError("Could not write to Bundle File.")
    }
}

func saveObject<T: Codable>(_ filename: String, currentId: T) {
    var data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find bundle with \(filename)")
    }

    do {
        data = try JSONEncoder().encode(currentId)
    } catch {
        fatalError("NOOOO")
    }

    do {
        try data.write(to: file)
    } catch {
        fatalError("Could not write to Bundle File.")
    }
}
