//
//  ActionButtonSection.swift
//  Travely
//
//  Created by alip on 20/06/21.
//

import SwiftUI

struct ActionButtonSection: View {
  @Binding var isFavorite: Bool

  var bookingCallback: () -> Void

  var body: some View {
    HStack(spacing: 20) {
      // MARK: bookmark button
      Button {
        withAnimation(.spring()) {
          isFavorite.toggle()
        }
      } label: {
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

      // MARK: change featured button
      Button {
        withAnimation(.spring()) {
          bookingCallback()
        }
      } label: {
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
    .padding(.vertical, 15)
    .background(Color.white)
  }
}
