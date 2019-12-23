//
//  SignInView.swift
//  EnvironmentObject
//
//  Created by Christina S on 12/5/19.
//  Copyright © 2019 Schelly. All rights reserved.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var userData: UserData
    var body: some View {
        ZStack {
            BackgroundImage(opacity: 0.4)
            VStack {
                Text("NERD\nPROFILER")
                    .font(.custom("BOSTON CAPS", size: 90.0))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 120)
                    .padding(.top, 100)
                Button(action: {
                    self.userData.isLoggedIn.toggle()
                }) {
                    Text("Sign In")
                        .frame(width: 200.0)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(color: Color.black, radius: 5)
                        .opacity(0.8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.neonBlue, lineWidth: 1)
                        )
                }
                Spacer()
            }
        }
    }
}
