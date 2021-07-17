//
//  ContentWrapper.swift
//  Travely
//
//  Created by alip on 20/06/21.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var modelData: ModelData
  
  var body: some View {
    if !modelData.isLoading && !modelData.isError {
      ZStack {
        CustomTabbar()
          .opacity(modelData.showDetail ? 0 : 1)
        
        if modelData.showDetail {
          DetailView()
        }
      }
    } else {
      VStack {
        Image(systemName: modelData.onboardIcon)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(height: 75)
        Text(modelData.onboardMessage)
          .font(.largeTitle)
      }
    }
  }
}

struct ContentWrapper_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environmentObject(ModelData())
      .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
      .previewDisplayName("iPhone SE (2nd generation)")
    
    ContentView()
      .environmentObject(ModelData())
      .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
      .previewDisplayName("iPhone 12 Pro")
  }
}
