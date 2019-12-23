//
//  KittyCatView.swift
//  EnvironmentObject
//
//  Created by Christina S on 11/30/19.
//  Copyright © 2019 Schelly. All rights reserved.
//

// A simple demonstration of EnvironmentObject

import SwiftUI


class KittyCat: ObservableObject {
    @Published var isCute: Bool = true
}

struct KittyViewTop: View {
    @EnvironmentObject var kitty: KittyCat
    var body: some View {
        VStack {
            Image("kitty")
            Toggle(isOn: $kitty.isCute) {
                Text("This Kitty is Cute")
            }.padding()
            KittyViewChild()
        }.background(Color.blue)
    }
}

struct KittyViewChild: View {
    var body: some View {
        VStack {
            Text("The following is a detailed report on whether or not the kitty is cute:").padding()
                .frame(width: 250, height: 250, alignment: .center)
            KittyViewGrandChild()
        }.background(Color.gray)
    }
}

struct KittyViewGrandChild: View {
    @EnvironmentObject var kitty: KittyCat
    var body: some View {
        let yesNo = kitty.isCute
        ? "Yes"
        : "No"
        let isIsNot = kitty.isCute
        ? "is"
        : "is not"
        return VStack {
            Text("\(yesNo), the kitty \(isIsNot) cute.").font(.headline).foregroundColor(.white)
                .frame(width: 200, height: 150, alignment: .center)
        }.background(Color.purple)
        
    }
}

struct KittyViewTop_Previews: PreviewProvider {
    static var previews: some View {
        KittyViewTop().environmentObject(KittyCat())
    }
}
