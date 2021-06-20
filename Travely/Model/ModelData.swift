//
//  ModelData.swift
//  Travely
//
//  Created by alip on 20/06/21.
//

import SwiftUI

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var allDestinations: [Destination] = load("destinationsData.json")

    @Published var selectedCategoryID = 1
    var destinations: [Destination] {
        if selectedCategoryID == 1 {
            return allDestinations
        } else {
            let filteredDestinations = allDestinations.filter { $0.category.id == selectedCategoryID }
            return filteredDestinations
        }
    }
    
    @Published var showDetail: Bool = false
    @Published var activeDestinationID: Int = 1
    var activeDestination: Destination {
        return allDestinations.first(where: { $0.id == activeDestinationID}) ?? allDestinations[0]
    }
    
    @Published var featuredIndex = 0
    var featuredDestination: Destination {
        return allDestinations[featuredIndex]
    }
    
    var categories: [CategoryDestination] = [
        CategoryDestination(id: 1, name: "All", icon: "✈️"),
        CategoryDestination(id: 2, name: "Beach", icon: "🏖"),
        CategoryDestination(id: 3, name: "Building", icon: "🏛"),
        CategoryDestination(id: 4, name: "Forest", icon: "🌲"),
        CategoryDestination(id: 5, name: "Mountain", icon: "⛰"),
    ]
    
    func changeFeatured(_ index: Int) -> Void {
        featuredIndex = index
    }
}

func load<T: Codable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
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
