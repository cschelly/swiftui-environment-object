//
//  PrivacySettings.swift
//  EnvironmentObject
//
//  Created by Christina S on 11/25/19.
//  Copyright © 2019 Schelly. All rights reserved.
//

import Foundation

struct PrivacySettings {
    var trackingConsent: ConsentStatus
    var trackingCategories: [TrackingCategory]
    var consented: Bool {
        didSet {
            updatePreferences()
        }
    }

    static let `default` = Self(trackingConsent: .allowed,
        trackingCategories: TrackingCategory.allCases,
        consented: true)

    init(trackingConsent: ConsentStatus,
        trackingCategories: [TrackingCategory],
        consented: Bool) {
        self.trackingConsent = trackingConsent
        self.trackingCategories = trackingCategories
        self.consented = consented
    }

    enum ConsentStatus: String {
        case allowed = "all allowed",
        partiallyAllowed = "partially allowed",
        noneAllowed = "none allowed"
    }

    enum TrackingCategory: String, CaseIterable {
        case analytics,
        affiliates,
        email,
        personalization,
        search,
        social,
        advertising
    }

    mutating func updatePreferences(_ delete: Bool = false) {
        if consented == false {
            trackingCategories.removeAll()
        } else if !delete {
            trackingCategories = TrackingCategory.allCases
        }
        
        if trackingCategories.count < 7 &&
            trackingCategories.count > 0 {
            trackingConsent = .partiallyAllowed
        } else if trackingCategories.count == 0 {
            trackingConsent = .noneAllowed
            if consented {
              consented = false
            }
        } else {
            trackingConsent = .allowed
        }

    }


}

