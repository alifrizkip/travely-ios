//
//  RatingSection.swift
//  Travely
//
//  Created by alip on 20/06/21.
//

import SwiftUI

struct RatingSection: View {
  var destination: Destination

  var body: some View {
    HStack {
      // MARK: rating
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

      // MARK: duration
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

      // MARK: weather
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
