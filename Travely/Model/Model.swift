//
//  Model.swift
//  Travely
//
//  Created by alip on 20/06/21.
//

import SwiftUI

struct CategoryDestination: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var icon: String
}

struct Destination: Hashable, Codable, Identifiable {
    var id: Int
    var isFavorite: Bool
    var name: String
    var location: String
    var price: String
    var description: String
    
    var rating: String
    var ratingCount: String
    var duration: String
    
    var weather: String
    var weatherIcon: String
    var weatherTemperature: String
    
    var category: CategoryDestination
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}
