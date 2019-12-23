//
//  UserData.swift
//  EnvironmentObject
//
//  Created by Christina S on 11/25/19.
//  Copyright © 2019 Schelly. All rights reserved.
//

import Foundation

class UserData: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var user: User = User.default
    @Published var privacySettings: PrivacySettings = PrivacySettings.default
    @Published var nerdLevelPercentage: Float = 80.0
    
    func calculateNerdLevel(basedOn user: User) {
        let activity = user.favoriteActivity
        let sport = user.favoriteSport
        
        let points = assignPoints(from: (activity, sport))
        nerdLevelPercentage = Float((points.activity + points.sport) / 2)
        self.user.nerdStatus = NerdStatus(percentage: nerdLevelPercentage)
    }
    
    func assignPoints(from selections: (User.Activity, User.Sport)) -> (activity: Int, sport: Int) {
        
        var activityPoints = 0
        var sportPoints = 0
        
        switch selections.0 {
            case .coding:
                activityPoints = 100
            case .reading:
                activityPoints = 75
            case .shopping:
                activityPoints = 50
            case .drinking:
                activityPoints = 25
        }
        
        switch selections.1 {
            case .gaming:
                sportPoints = 100
            case .golf:
                sportPoints = 75
            case .basketball:
                sportPoints = 50
            case .football:
                sportPoints = 25
        }
        
        return (activity: activityPoints, sport: sportPoints)
    }
    
    
}
