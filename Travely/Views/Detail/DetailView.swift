//
//  DetailView.swift
//  Travely
//
//  Created by alip on 20/06/21.
//

import SwiftUI

struct DetailView: View {
  @EnvironmentObject var modelData: ModelData

  var destination: Destination {
    return modelData.activeDestination
  }

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
        ScrollView(showsIndicators: false) {
          VStack {
            DestinationImageBanner(
              showDetail: $modelData.showDetail,
              destinationImage: destination.image,
              width: geo.size.width
            )

            VStack(alignment: .leading) {
              HStack {
                Text(destination.name)
                  .font(.title)

                Spacer()

                Text(destination.price)
                  .font(.title)
                  .fontWeight(.medium)
              }

              HStack(alignment: .firstTextBaseline) {
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
        .padding(.bottom, 80)

        ActionButtonSection(
          isFavorite: $modelData.allDestinations[destinationIndex].isFavorite,
          bookingCallback: {
            modelData.changeFeatured(destinationIndex)
          }
        )
      }
    }
    .foregroundColor(Color("PrimaryText"))
  }
}

struct DetailView_Previews: PreviewProvider {
  static var previews: some View {
    DetailView()
      .environmentObject(ModelData())
      .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
      .previewDisplayName("iPhone SE (2nd generation)")

    DetailView()
      .environmentObject(ModelData())
      .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
      .previewDisplayName("iPhone 12 Pro")
  }
}
