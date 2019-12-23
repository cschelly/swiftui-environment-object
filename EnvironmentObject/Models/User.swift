//
//  User.swift
//  EnvironmentObject
//
//  Created by Christina S on 11/25/19.
//  Copyright © 2019 Schelly. All rights reserved.
//

import SwiftUI

struct User {
    var userName: String
    var firstName: String
    var profileImage: String
    var favoriteActivity: Activity
    var favoriteSport: Sport
    var nerdStatus: NerdStatus
    
    static let `default` = Self(userName: "schelly",
                                firstName: "Christina",
                                profileImage: "kitty",
                                favoriteActivity: .coding,
                                favoriteSport: .gaming,
                                nerdStatus: NerdStatus(percentage: 80.0))
    
    init(userName: String,
         firstName: String,
         profileImage: String,
         favoriteActivity: Activity,
         favoriteSport: Sport,
         nerdStatus: NerdStatus) {
        self.userName = userName
        self.firstName = firstName
        self.profileImage = profileImage
        self.favoriteActivity = favoriteActivity
        self.favoriteSport = favoriteSport
        self.nerdStatus = nerdStatus
    }
    
    var image: Image {
        Image(profileImage)
    }
    
    enum Sport: String, CaseIterable {
        case basketball = "🏀", // normal
        football = "🏈", // cool
        golf = "⛳️", // nerd
        gaming = "🎮" // super nerd
    }

    enum Activity: String, CaseIterable {
        case coding = "👩🏻‍💻", // super nerd
        drinking = "🍺", // cool
        reading = "📚", // nerd
        shopping = "🛍" // normal
    }
    
}
