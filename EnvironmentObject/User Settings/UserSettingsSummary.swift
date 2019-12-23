//
//  UserSettingsSummary.swift
//  EnvironmentObject
//
//  Created by Christina S on 12/7/19.
//  Copyright © 2019 Schelly. All rights reserved.
//

import SwiftUI

struct UserSettingsSummary: View {
    var user: User
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundImage(opacity: 0.3)
                VStack(spacing: 30) {
                    Divider()
                    Text(user.userName)
                        .bold()
                        .font(.title)
                    
                    Text("\(self.user.firstName)")
                    
                    self.user.image
                    
                    Text("Favorite Activity:")
                    Text("\(self.user.favoriteActivity.rawValue)")
                        .font(.largeTitle)
                    
                    Text("Favorite Sport:")
                    Text("\(self.user.favoriteSport.rawValue)")
                        .font(.largeTitle)
                    
                }
            }
            .padding(.top, -100)
            .navigationBarTitle("Nerd Profile")
        }
    }
}

struct UserSettingsSummary_Previews: PreviewProvider {
    static var previews: some View {
        UserSettingsSummary(user: User.default)
    }
}
