//
//  CustomTabbar.swift
//  Travely
//
//  Created by alip on 20/06/21.
//

import SwiftUI

var tabs = ["home","bookmark","profile"]

struct TabItem: Hashable {
    var tag: String
    var icon: String
}

var tabsItems = [
    TabItem(tag: "home", icon: "house.fill"),
    TabItem(tag: "bookmark", icon: "bookmark.fill"),
    TabItem(tag: "profile", icon: "person.fill"),
]

struct CustomTabbar: View {
    @Binding var isShowDetail: Bool
    @Binding var activeDestination: Destination
    
    @State var selectedTab = "home"
    
    var body: some View {
        NavigationView{
            ZStack(
                alignment: Alignment(
                    horizontal: .center,
                    vertical: .bottom
                )
            ) {
                TabView(selection: $selectedTab) {
                    
                    HomeView(isShowDetail: $isShowDetail, activeDestination: $activeDestination)
                        .tag("home")
                    
                    Email()
                        .tag("bookmark")
                    
                    Folder()
                        .tag("profile")
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .padding(.bottom, 80)
                
                HStack(spacing: 0){
                    
                    ForEach(tabsItems, id: \.self){tabItem in
                        
                        TabButton(item: tabItem, selectedTab: $selectedTab)
                        
                        if tabItem.tag != tabsItems.last?.tag{
                            Spacer(minLength: 0)
                        }
                    }
                }
                .padding(.horizontal, 50)
                .padding(.top, 15)
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
    @State static var showDetail = false
    @State static var activeDestination = ModelData().allDestinations[2]
    static var previews: some View {
        CustomTabbar(isShowDetail: $showDetail, activeDestination: $activeDestination)
            .environmentObject(ModelData())
    }
}

struct TabButton : View {
    var item: TabItem
    @Binding var selectedTab : String
    
    var body: some View{
        
        Button(action: {selectedTab = item.tag}) {
            
            Image(systemName: item.icon)
                .resizable()
                .aspectRatio(1/1, contentMode: .fit)
                .frame(height: 25)
                .foregroundColor(selectedTab == item.tag ? Color.black : Color.gray)
                .padding()
        }
    }
}

struct Email : View {
    var body: some View{
        Color.pink
    }
}

struct Folder : View {
    var body: some View{
        Color.yellow
    }
}
