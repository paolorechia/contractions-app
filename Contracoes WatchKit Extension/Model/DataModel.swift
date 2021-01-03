//
//  DataModel.swift
//  Contracoes WatchKit Extension
//
//  Created by Paolo on 02/01/21.
//

import Foundation
import Combine

final class DataModel: ObservableObject {
    static let OBSERVATION_PERIOD_IN_MINUTES: Double = 10.0
    static let TIME_FILTER_IN_SECONDS: Double = 60 * 60 * OBSERVATION_PERIOD_IN_MINUTES
    static let NUMBER_OF_CONTRACTIONS_FOR_ALERT: Int = 3
    static let AVERAGE_DURATION_IN_SECONDS_FOR_ALERT: Int = 30
    static let MAX_RELEVANT_CONTRACTIONS: Int = 3
    
    @Published var history: [Contraction] = load("history.json")
    @Published var currentId: CurrentId = load("currentId.json")
    
    @Published var recentHistory: [Contraction] = []
    @Published var recentHistorySlice: ArraySlice<Contraction> = []
    @Published var recentContractions: Int = 0
    @Published var averageDuration: Int = 0
    @Published var averageInterval: Int = 0
    
    @Published var showAlert: Bool = false

    func saveContraction(_ contraction: Contraction) {
        history.append(contraction)
        currentId.value += 1
        saveArray("history.json", history: history)
        saveObject("currentId.json", currentId: currentId)
    }
    
    func updateDash() {
        // Slice last 3 elements out of history
        let n = history.count
        var historySlice: ArraySlice<Contraction>
        if n > DataModel.MAX_RELEVANT_CONTRACTIONS {
            historySlice = history[n-DataModel.MAX_RELEVANT_CONTRACTIONS..<n]
        } else {
            historySlice = history[0..<n]
        }
        
        // Filter by time and compute total duration
        let now = Date()
        var totalDuration = 0
        var recentHistory: [Contraction] = []
        for hist in historySlice {
            let timeDifferenceInSeconds = abs(hist.start.timeIntervalSince(now))
            if (timeDifferenceInSeconds < DataModel.TIME_FILTER_IN_SECONDS) {
                totalDuration += hist.durationInSeconds
                recentHistory.append(hist)
            }
        }

        // Compute intervals
        var i = 1
        var totalIntervals = 0.0
        while i < recentHistory.count {
            totalIntervals += abs(recentHistory[i].start.timeIntervalSince(recentHistory[i-1].end))
            i += 1
        }
        
        // Update published vars
        recentContractions = historySlice.count
        averageDuration = totalDuration / recentContractions
        averageInterval = Int(totalIntervals / Double(recentContractions)) / 60
        
        showAlert = (recentContractions >= DataModel.NUMBER_OF_CONTRACTIONS_FOR_ALERT &&
                        averageDuration > DataModel.AVERAGE_DURATION_IN_SECONDS_FOR_ALERT)
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
