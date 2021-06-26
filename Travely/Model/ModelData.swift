//
//  ModelData.swift
//  Travely
//
//  Created by alip on 20/06/21.
//

import SwiftUI

import Foundation
import Combine
import Alamofire

extension Array {
    subscript(safe index: Index) -> Element? {
        let isValidIndex = index >= 0 && index < count
        return isValidIndex ? self[index] : nil
    }
}

final class ModelData: ObservableObject {    
    @Published var selectedTab = "home"
    @Published var allDestinations: [Destination] = []
    
    var profile = Profile(name: "Alif Rizki Pambudi",
                          githubLabel: "github.com/alifrizkip",
                          email: "alifrizkipambudi@gmail.com",
                          avatarName: "avatar")
    
    @Published var selectedCategoryID = 1
    var destinations: [Destination] {
        if selectedCategoryID == 1 {
            return allDestinations
        } else {
            let filteredDestinations = allDestinations.filter { $0.category.id == selectedCategoryID }
            return filteredDestinations
        }
    }
    var favoriteDestinations: [Destination] {
        return allDestinations.filter { $0.isFavorite }
    }
    
    @Published var showDetail: Bool = false
    @Published var activeDestinationID: Int = 1
    var activeDestination: Destination {
        return allDestinations.first(where: { $0.id == activeDestinationID}) ?? allDestinations[0]
    }
    
    @Published var featuredIndex = 0
    var featuredDestination: Destination? {
        return allDestinations[safe: featuredIndex]
    }
    
    var categories: [CategoryDestination] = [
        CategoryDestination(id: 1, name: "All", icon: "✈️"),
        CategoryDestination(id: 2, name: "Beach", icon: "🏖"),
        CategoryDestination(id: 3, name: "Building", icon: "🏛"),
        CategoryDestination(id: 4, name: "Forest", icon: "🌲"),
        CategoryDestination(id: 5, name: "Mountain", icon: "⛰"),
    ]
    
    @Published var isLoading: Bool = true
    @Published var onboardIcon: String = "tray.and.arrow.down"
    @Published var onboardMessage: String = "Loading Data..."
    @Published var isError: Bool = false
    init() {
        AF.request("https://dicoding-ios-app-pemula-api.web.app/destinations.json").response { response in
            switch response.result {
            case .success:
                if let jsonData = response.data {
                    let jsonDecoder = JSONDecoder()
                    do {
                        let destinationsDatas = try jsonDecoder.decode([Destination].self, from: jsonData)
                        print("success: load api n parsing data")
                        self.isLoading = false
                        self.allDestinations = destinationsDatas
                    } catch _{
                        print("error: parsing json data")
                        self.isLoading = false
                        self.setErrorLoadData()
                    }
                }
            case .failure(_):
                print("error: load data from api")
                self.setErrorLoadData()
            }
        }
    }
    
    func setErrorLoadData() -> Void {
        self.isLoading = false
        self.isError = true
        self.onboardIcon = "xmark.circle"
        self.onboardMessage = "Failed Load Data"
    }
    
    func changeFeatured(_ index: Int) -> Void {
        featuredIndex = index
    }
}
