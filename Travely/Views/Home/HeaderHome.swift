//
//  HeaderView.swift
//  Travely
//
//  Created by alip on 19/06/21.
//

import SwiftUI

struct HeaderHome: View {
  @EnvironmentObject var modelData: ModelData
  @Binding var search: String
  
  var body: some View {
    HStack (spacing: 20) {
      HStack {
        Image(systemName: "magnifyingglass")
          .font(.system(size: 23, weight: .light))
          .foregroundColor(.gray)
        
        TextField("Search...", text: $search)
          .font(.system(size: 20))
      }
      .padding(.vertical, 14)
      .padding(.horizontal, 16)
      .frame(height: 54)
      .overlay(
        RoundedRectangle(cornerRadius: 27)
          .stroke(Color.gray, lineWidth: 1)
      )
      
      Button(action: {
        withAnimation(.spring()) {
          modelData.selectedTab = "profile"
        }
      }) {
        modelData.profile.avatar
          .resizable()
          .frame(width: 54, height: 54)
          .clipShape(Circle())
      }
    }
  }
}

struct HeaderView_Previews: PreviewProvider {
  @State static var search = ""
  static var previews: some View {
    HeaderHome(search: $search)
      .environmentObject(ModelData())
  }
}
