//
//  ProfileView.swift
//  Travely
//
//  Created by alip on 20/06/21.
//

import SwiftUI

struct ProfileView: View {
  @EnvironmentObject var modelData: ModelData
  
  var profile: Profile {
    return modelData.profile
  }
  
  var body: some View {
    VStack (alignment: .center) {
      HStack {
        Text("About me")
          .font(.title)
          .padding(.top, 10)
        
        Spacer(minLength: 0)
      }
      
      profile.avatar
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(
          width: 200,
          height: 200,
          alignment: Alignment(horizontal: .center, vertical: .center)
        )
        .clipShape(Circle())
        .padding(.top, 100)
      
      Text(profile.name)
        .font(.title)
        .padding(.top)
      
      Link(profile.githubLabel, destination: URL(string: profile.githubLink)!)
        .font(.title2)
        .padding(.top, 5)
        .foregroundColor(.blue)
      
      HStack {
        Image(systemName: "envelope.fill")
        
        Text(profile.email)
      }
      .font(.title2)
      .padding(.top, 5)
      
      Spacer(minLength: 0)
    }
    .padding(.horizontal, 30)
    .foregroundColor(Color("PrimaryText"))
  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileView()
      .environmentObject(ModelData())
  }
}
