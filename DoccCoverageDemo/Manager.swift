//
//  Manager.swift
//  DoccCoverageDemo
//
//  Created by Sofia Diniz Melo Santos on 04/04/25.
//

import Foundation

struct Manager {
    
    static var shared = Manager()
    
    func receiveJSON() -> [DocItem]? {
        if let url = Bundle.main.url(forResource: "example", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let docItem = try JSONDecoder().decode(DocItem.self, from: data)
                return [docItem]
            } catch {
                print("Error decoding: \(error)")
            }
        }
        return nil

    }
}
