//
//  NerdLevel.swift
//  EnvironmentObject
//
//  Created by Christina S on 12/6/19.
//  Copyright © 2019 Schelly. All rights reserved.
//

import SwiftUI

struct NerdStatus {
    var percentage: Float
    var nerdLevel: NerdLevel
    
    init(percentage: Float) {
        self.percentage = percentage
        self.nerdLevel = NerdLevel(percentage)
    }
}

enum NerdLevel: String {
    case superNerd, nerd, normal, cool
    
    init(_ percentage: Float) {
        switch percentage {
        case 0.0...30.0:
            self = .cool
        case 30.1...50.0:
            self = .normal
        case 50.1...70.0:
            self = .nerd
        case 70.1...100.0:
            self = .superNerd
        default:
            self = .normal
            break
        }
    }

    var title: String {
        switch self {
        case .superNerd: return "a Super Nerd!"
        case .nerd: return "you are an every day nerd. Congratulations!"
        case .normal: return "a normal person and not really a nerd at all."
        case .cool: return "a cool person. Why do you have this app?"
        }
    }
    
    var image: String {
        return self.rawValue
    }
    
}
