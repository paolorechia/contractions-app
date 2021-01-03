//
//  DataModel.swift
//  Contracoes WatchKit Extension
//
//  Created by Paolo on 02/01/21.
//

import Foundation
import Combine

final class DataModel: ObservableObject {
    @Published var history: [Contraction] = load("history.json")
    @Published var currentId: Int = 0
    
    func saveContraction(_ contraction: Contraction) {
        history.append(contraction)
        currentId += 1
        save("history.json", history: history)
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


func save<T: Codable>(_ filename: String, history: [T]) {
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
