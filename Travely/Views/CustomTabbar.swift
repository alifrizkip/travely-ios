//
//  CustomTabbar.swift
//  Travely
//
//  Created by alip on 20/06/21.
//

import SwiftUI

var tabs = ["home", "bookmark", "profile"]

struct TabItem: Hashable {
  var tag: String
  var icon: String
}

var tabsItems = [
  TabItem(tag: "home", icon: "house.fill"),
  TabItem(tag: "bookmark", icon: "bookmark.fill"),
  TabItem(tag: "profile", icon: "person.fill")
]

struct CustomTabbar: View {
  @EnvironmentObject var modelData: ModelData

  var body: some View {
    NavigationView {
      ZStack(
        alignment: Alignment(
          horizontal: .center,
          vertical: .bottom
        )
      ) {
        TabView(selection: $modelData.selectedTab) {
          HomeView()
            .tag("home")

          FavoriteView()
            .tag("bookmark")

          ProfileView()
            .tag("profile")
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .padding(.bottom, 90)

        HStack(spacing: 0) {
          ForEach(tabsItems, id: \.self) {tabItem in
            TabButton(item: tabItem, selectedTab: $modelData.selectedTab)

            if tabItem.tag != tabsItems.last?.tag {
              Spacer(minLength: 0)
            }
          }
        }
        .padding(.horizontal, 50)
        .padding(.vertical, 15)
        .background(Color.white)
      }
      .ignoresSafeArea(.keyboard, edges: .bottom)
      .navigationTitle("")
      .navigationBarTitleDisplayMode(.inline)
      .navigationBarHidden(true)
    }
  }
}

struct CustomTabbar_Previews: PreviewProvider {
  static var previews: some View {
    CustomTabbar()
      .environmentObject(ModelData())
  }
}

struct TabButton: View {
  var item: TabItem
  @Binding var selectedTab: String

  var body: some View {
    Button { selectedTab = item.tag } label: {
      Image(systemName: item.icon)
        .resizable()
        .aspectRatio(1 / 1, contentMode: .fit)
        .frame(height: 25)
        .foregroundColor(selectedTab == item.tag ? Color.black : Color.gray)
        .padding()
    }
  }
}
