//
//  Model.swift
//  Travely
//
//  Created by alip on 20/06/21.
//

import SwiftUI

struct CategoryDestination: Hashable, Codable, Identifiable {
  let id: Int
  let name: String
  let icon: String
}

struct Profile {
  let name: String
  let githubLabel: String
  let email: String
  let avatarName: String
  var avatar: Image {
    Image(avatarName)
  }
  var githubLink: String {
    return "https://\(githubLabel)"
  }
}

struct Destination: Hashable, Codable, Identifiable {
  let id: Int
  var isFavorite: Bool
  let name: String
  let location: String
  let price: String
  let description: String

  let rating: String
  let ratingCount: String
  let duration: String

  let weather: String
  let weatherIcon: String
  let weatherTemperature: String

  let category: CategoryDestination

  private let imageName: String
  var image: Image {
    Image(imageName)
  }
}
