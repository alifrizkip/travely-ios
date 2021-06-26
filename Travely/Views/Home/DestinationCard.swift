//
//  DestinationCardView.swift
//  Travely
//
//  Created by alip on 19/06/21.
//

import SwiftUI

struct DestinationCard: View {
    @EnvironmentObject var modelData: ModelData
    
    var destination: Destination
    
    var width: CGFloat
    var height: CGFloat {
        return width / 167 * 180
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
                
                HStack (alignment: .firstTextBaseline) {
                    Image(systemName: "map.fill")
                        .font(.system(size: 12))
                    
                    Text(destination.location)
                    
                    Spacer(minLength: 0)
                }
                .font(.caption)
                .foregroundColor(.white)
            }
            .padding(15)
        }
        .frame(width: width, height: height)
    }
}


struct DestinationCardView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            DestinationCard(destination: ModelData().allDestinations[0], width: geo.size.width)
                .environmentObject(ModelData())
        }
    }
}
