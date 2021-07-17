//
//  FeaturedDestinationCardView.swift
//  Travely
//
//  Created by alip on 19/06/21.
//

import SwiftUI

struct FeaturedDestinationCard: View {
  var destination: Destination
  
  var width: CGFloat
  var height: CGFloat {
    return width / 354 * 210
  }
  
  var body: some View {
    ZStack (alignment: .bottomLeading) {
      destination.image
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(
          width: width,
          height: height,
          alignment: Alignment(horizontal: .center, vertical: .center)
        )
        .clipped()
        .cornerRadius(20)
      
      Rectangle()
        .foregroundColor(.clear)
        .background(
          LinearGradient(
            gradient: Gradient(
              colors: [.clear, .clear, Color("PrimaryText")]),
            startPoint: .top,
            endPoint: .bottom
          )
        )
        .cornerRadius(20)
      
      VStack (alignment: .leading) {
        HStack {
          ZStack {
            RoundedRectangle(cornerRadius: 25)
              .foregroundColor(.gray)
              .frame(width: 65, height: 25)
            
            HStack {
              Image(systemName: "star.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 15)
                .foregroundColor(.yellow)
              
              Text(destination.rating)
                .foregroundColor(.white)
                .fontWeight(.semibold)
            }
          }
          
          Spacer(minLength: 0)
          
          ZStack {
            Circle()
              .frame(width: 30, height: 30)
              .foregroundColor(Color("BadgeBackground"))
            
            Image(systemName: destination.isFavorite ? "bookmark.fill" : "bookmark")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(height: 15)
              .foregroundColor(.white)
          }
        }
        
        Spacer(minLength: 0)
        
        Text(destination.name)
          .foregroundColor(.white)
          .font(.title3)
        
        HStack (alignment: .firstTextBaseline) {
          Image(systemName: "map.fill")
            .font(.system(size: 12))
          
          Text(destination.location)
            .font(.subheadline)
          
          Spacer(minLength: 0)
        }
        .foregroundColor(.white)
      }
      .padding(20)
    }
    .frame(width: width, height: height)
  }
  
}

struct FeaturedDestinationCardView_Previews: PreviewProvider {
  static var previews: some View {
    GeometryReader { geo in
      FeaturedDestinationCard(destination: ModelData().allDestinations[3], width: geo.size.width)
    }
  }
}
