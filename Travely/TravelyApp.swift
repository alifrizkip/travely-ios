//
//  TravelyApp.swift
//  Travely
//
//  Created by alip on 19/06/21.
//

import SwiftUI

@main
struct TravelyApp: App {
  @StateObject private var modelData = ModelData()

  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(modelData)
    }
  }
}
