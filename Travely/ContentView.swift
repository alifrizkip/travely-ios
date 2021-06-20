//
//  ContentWrapper.swift
//  Travely
//
//  Created by alip on 20/06/21.
//

import SwiftUI

struct ContentView: View {
    @State var isShowDetail = false
    @State var activeDestination: Destination = ModelData().allDestinations[0]
    
    var body: some View {
        ZStack {
            CustomTabbar(isShowDetail: $isShowDetail, activeDestination: $activeDestination)
                .opacity(isShowDetail ? 0 : 1)
            
            if isShowDetail {
                DetailView(showDetail: $isShowDetail, destination: $activeDestination)
            }
        }
    }
}

struct ContentWrapper_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
