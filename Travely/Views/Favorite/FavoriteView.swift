//
//  FavoriteView.swift
//  Travely
//
//  Created by alip on 20/06/21.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var modelData: ModelData
    
    var destination = ModelData().allDestinations[0]
    
    var body: some View {
        VStack (alignment: .center) {
            HStack {
                Text("My Bucketlists")
                    .font(.title)
                    .padding(.top, 10)
                
                Spacer(minLength: 0)
            }
            if modelData.favoriteDestinations.count > 0 {
                ScrollView {
                    VStack (spacing: 20) {
                        ForEach (modelData.favoriteDestinations, id: \.self) { item in
                            FavoriteRow(destination: item)
                                .cornerRadius(20)
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        modelData.activeDestinationID = item.id
                                        modelData.showDetail.toggle()
                                    }
                                }
                        }
                    }
                }
                .padding(.top, 10)
            } else {
                Spacer()
                Image(systemName: "xmark.bin")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 75)
                Text("No bucketlist")
                    .font(.largeTitle)
                Spacer()
            }
        }
        .padding(.horizontal, 30)
        .foregroundColor(Color("PrimaryText"))
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
            .environmentObject(ModelData())
    }
}

struct FavoriteRow: View {
    var destination: Destination
    
    var body: some View {
        HStack (alignment: .center, spacing: 0) {
            destination.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(
                    width: 115,
                    height: 115,
                    alignment: Alignment(horizontal: .center, vertical: .center)
                )
                .clipped()
            
            VStack (alignment: .leading, spacing: 5) {
                Text("\(destination.category.icon) \(destination.category.name)")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                VStack (alignment: .leading) {
                    Text(destination.name)
                        .fontWeight(.medium)
                    
                    HStack (alignment: .firstTextBaseline) {
                        Image(systemName: "map.fill")
                        
                        Text(destination.location)
                    }
                    .font(.caption)
                    .foregroundColor(.gray)
                }
                
                Spacer(minLength: 0)
                
                HStack {
                    // MARK: rating
                    VStack (spacing: 3) {
                        HStack (spacing: 3) {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            
                            Text(destination.rating)
                        }
                        
                        Text(destination.ratingCount)
                            .foregroundColor(.gray)
                            .font(.caption2)
                    }
                    Spacer(minLength: 0)
                    
                    // MARK: duration
                    VStack (spacing: 3) {
                        HStack (spacing: 3) {
                            Image(systemName: "clock.fill")
                                .foregroundColor(.orange)
                            
                            Text(destination.duration)
                        }
                        
                        Text("Duration")
                            .foregroundColor(.gray)
                            .font(.caption2)
                    }
                    Spacer(minLength: 0)
                    
                    // MARK: weather
                    VStack (spacing: 3) {
                        HStack (spacing: 3) {
                            Image(systemName: destination.weatherIcon)
                                .foregroundColor(.blue)
                            
                            Text(destination.weatherTemperature)
                        }
                        
                        Text(destination.weather)
                            .foregroundColor(.gray)
                            .font(.caption2)
                    }
                }
                .font(.caption)
            }
            .padding(.all, 10)
        }
        .background(Color("LightGrayColor"))
    }
}
