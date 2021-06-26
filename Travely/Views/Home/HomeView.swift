//
//  Home.swift
//  Travely
//
//  Created by alip on 19/06/21.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var modelData: ModelData
    @State var search = ""
    
    var body: some View {
        VStack (alignment: .leading) {
            HeaderHome(search: $search)
                .padding(.vertical, 10)
            
            ScrollView (.vertical, showsIndicators: false) {
                VStack (alignment: .leading) {
                    Text("Let’s go trip with us!")
                        .font(.title)
                        .padding(.top, 30)
                        .padding(.bottom, 20)
                    
                    if (modelData.featuredDestination != nil) {
                        GeometryReader { geo in
                            FeaturedDestinationCard(destination: modelData.featuredDestination!, width: geo.size.width)
                        }
                        .aspectRatio(354/210, contentMode: .fit)
                    }
                    
                    Text("Categories")
                        .font(.title2)
                        .padding(.top, 20)
                        .padding(.bottom, 10)
                    
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack(spacing: 16 ) {
                            ForEach(modelData.categories) { category in
                                CategoryItem(selectedCategoryID: $modelData.selectedCategoryID, category: category)
                            }
                        }
                        .padding(1)
                    }
                    
                    Text("For you")
                        .font(.title2)
                        .padding(.top, 20)
                        .padding(.bottom, 10)
                    
                    LazyVGrid(
                        columns: Array(
                            repeating: GridItem(.flexible(), spacing: 20),
                            count: 2
                        ),
                        spacing: 25
                    ) {
                        ForEach(modelData.destinations, id: \.self) {destination in
                            GeometryReader { geo in
                                DestinationCard(destination: destination, width: geo.size.width)
                                    .onTapGesture {
                                        withAnimation(.spring()) {
                                            modelData.activeDestinationID = destination.id
                                            modelData.showDetail.toggle()
                                        }
                                    }
                            }
                            .aspectRatio(167 / 180, contentMode: .fit)
                        }
                    }
                }
                
            }
        }
        .foregroundColor(Color("PrimaryText"))
        .padding(.horizontal, 30)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ModelData())
    }
}

struct CategoryItem: View {
    @Binding var selectedCategoryID: Int
    var category: CategoryDestination

    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                selectedCategoryID = category.id
            }
        }) {
            HStack (alignment: .center, spacing: 16) {
                Text(category.icon)
                Text(category.name)
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .foregroundColor(category.id == selectedCategoryID ? .white : Color("PrimaryText") )
            .background(
                ZStack {
                    if category.id == selectedCategoryID {
                        Color("PrimaryText")
                            .clipShape(Capsule())
                    }
                }
            )
            .overlay(
                RoundedRectangle(cornerRadius: 100)
                    .stroke(Color.gray, lineWidth: 1)
        )
        }
    }
}
