//
//  DetailView.swift
//  Travely
//
//  Created by alip on 20/06/21.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var modelData: ModelData
    @Binding var showDetail: Bool
    @Binding var destination: Destination
    
    var destinationIndex: Int {
        modelData.allDestinations.firstIndex(where: { $0.id == destination.id })!
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack(
                alignment: Alignment(
                    horizontal: .center,
                    vertical: .bottom
                )
            ) {
                ScrollView (showsIndicators: false) {
                    VStack {
                        DestinationImageBanner(showDetail: $showDetail, destinationImage: destination.image, width: geo.size.width)
                        
                        VStack (alignment: .leading) {
                            HStack {
                                Text(destination.name)
                                    .font(.title)
                                
                                Spacer()
                                
                                Text(destination.price)
                                    .font(.title)
                                    .fontWeight(.medium)
                            }
                            
                            HStack (alignment: .firstTextBaseline) {
                                Image(systemName: "map.fill")
                                
                                Text(destination.location)
                            }
                            .font(.title3)
                            .foregroundColor(.gray)
                            .padding(.top, 1)
                            
                            RatingSection(destination: destination)
                            
                            Text("Description")
                                .font(.title2)
                                .padding(.top, 30)
                                .padding(.bottom, 10)
                            
                            Text(destination.description)
                                .fixedSize(horizontal: false, vertical: true)
                                .foregroundColor(.gray)
                        }
                        .padding()
                    }
                }
                .padding(.bottom, 70)
                
                ActionButtonSection(
                    isFavorite: $modelData.allDestinations[destinationIndex].isFavorite,
                    bookingCallback: {
                        // print("callback test")
                        modelData.changeFeatured(destinationIndex)
                    }
                )
            }
        }
        .foregroundColor(Color("PrimaryText"))
    }
}

struct DetailView_Previews: PreviewProvider {
    @State static var item = ModelData().allDestinations[2]
    @State static var showDetail = true
    static var previews: some View {
        DetailView(showDetail: $showDetail, destination: $item)
            .environmentObject(ModelData())
    }
}

struct DestinationImageBanner: View {
    @Binding var showDetail: Bool
    
    var destinationImage: Image
    var width: CGFloat
    
    var body: some View {
        ZStack (alignment: .top) {
            destinationImage
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(
                    width: width,
                    height: width / 414 * 475,
                    alignment: Alignment(horizontal: .center, vertical: .center)
                )
                .clipped()
            
            HStack {
                Button(action: {
                    withAnimation(.spring()) {
                        showDetail.toggle()
                    }
                }) {
                    ZStack {
                        Circle()
                            .frame(width: 54, height: 54)
                            .foregroundColor(Color("BadgeBackground"))
                        
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .aspectRatio(1 / 2, contentMode: .fit)
                            .frame(height: 25)
                            .foregroundColor(.white)
                            .offset(x: -2)
                    }
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation(.spring()) {}
                }) {
                    ZStack {
                        Circle()
                            .frame(width: 54, height: 54)
                            .foregroundColor(Color("BadgeBackground"))
                        
                        Image(systemName: "link")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.white)
                    }
                }
            }
            .padding(.top, 40)
            .padding(.horizontal, 30)
            .foregroundColor(.white)
        }
    }
}

struct RatingSection: View {
    var destination: Destination
    
    var body: some View {
        HStack {
            // rating
            VStack {
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                    Text(destination.rating)
                        .fontWeight(.semibold)
                }
                .font(.title3)
                .padding(.bottom, 1)
                
                Text(destination.ratingCount)
                    .font(.body)
                    .foregroundColor(.gray)
            }
            Spacer(minLength: 0)
            
            // duration
            VStack {
                HStack {
                    Image(systemName: "clock.fill")
                        .foregroundColor(.orange)
                    
                    Text(destination.duration)
                        .fontWeight(.semibold)
                }
                .font(.title3)
                .padding(.bottom, 1)
                
                Text("Duration")
                    .font(.body)
                    .foregroundColor(.gray)
            }
            Spacer(minLength: 0)
            
            // weather
            VStack {
                HStack {
                    Image(systemName: destination.weatherIcon)
                        .foregroundColor(.blue)
                    
                    Text(destination.weatherTemperature)
                        .fontWeight(.semibold)
                }
                .font(.title3)
                .padding(.bottom, 1)
                
                Text(destination.weather)
                    .font(.body)
                    .foregroundColor(.gray)
            }
        }
        .padding(.top, 30)
        .padding(.horizontal, 10)
    }
}

struct ActionButtonSection: View {
    @Binding var isFavorite: Bool
    
    var bookingCallback: () -> Void
    
    var body: some View {
        HStack(spacing: 20){
            Button(action: {
                withAnimation(.spring()) {
                    isFavorite.toggle()
                }
            }) {
                ZStack {
                    Circle()
                        .stroke(Color.gray, lineWidth: 1)
                        .frame(width: 54, height: 54)
                        .foregroundColor(Color.white)
                    
                    Image(systemName: isFavorite ? "bookmark.fill" : "bookmark")
                        .resizable()
                        .frame(width: 18, height: 24)
                        .foregroundColor(Color("PrimaryText"))
                }
            }
            
            Button(action: {
                withAnimation(.spring()) {
                    bookingCallback()
                }
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(height: 54)
                        .foregroundColor(Color("PrimaryText"))
                    
                    Text("Book now")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
            }
        }
        .padding(.horizontal)
    }
}
