//
//  DestinationImageBanner.swift
//  Travely
//
//  Created by alip on 20/06/21.
//

import SwiftUI

struct DestinationImageBanner: View {
  @Binding var showDetail: Bool

  var destinationImage: Image
  var width: CGFloat

  var body: some View {
    ZStack(alignment: .top) {
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
