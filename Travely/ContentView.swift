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
        ZStack {
            CustomTabbar()
                .opacity(modelData.showDetail ? 0 : 1)
            
            if modelData.showDetail {
                DetailView()
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
