//
//  BackgroundImage.swift
//  EnvironmentObject
//
//  Created by Christina S on 12/5/19.
//  Copyright © 2019 Schelly. All rights reserved.
//

import SwiftUI

struct BackgroundImage: View {
    var opacity: Double
    var body: some View {
        Image("background")
            .resizable()
            .scaledToFill()
            .opacity(opacity)
            .blur(radius: 7.0)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImage(opacity: 0.3)
    }
}
