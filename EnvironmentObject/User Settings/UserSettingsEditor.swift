//
//  UserSettingsEditor.swift
//  EnvironmentObject
//
//  Created by Christina S on 12/7/19.
//  Copyright © 2019 Schelly. All rights reserved.
//

import SwiftUI

struct UserSettingsEditor: View {
    @EnvironmentObject var userData: UserData
    @Binding var user: User
    @State private var showPrivacySettings = false
    
    var privacySettingsButton: some View {
        Button(action: { self.showPrivacySettings.toggle() }) {
            Image(systemName: "lock.shield.fill")
                .imageScale(.large)
                .accessibility(label: Text("Privacy Settings"))
                .padding()
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
        
                HStack {
                    Text("Username").bold()
                    Divider().frame(height: 10)
                    TextField("Username", text: $user.userName)
                }.padding()

                HStack {
                    Text("First Name").bold()
                    Divider().frame(height: 10)
                    TextField("First Name", text: $user.firstName)
                }.padding()

//                    VStack {
//                        Text("Click to Update Image: ")
//                        Button(action: {
//                             // ... TODO: Upload action
//                         }) {
//                            self.user.image
//                         }
//                    }

                Section(header: Text("Favorite Activity").font(.headline)) {

                    Picker(selection: $user.favoriteActivity, label: Text("Select Your Favorite Activity")) {
                        ForEach(User.Activity.allCases, id: \.self) { activity in
                            Text(activity.rawValue.capitalized).tag(activity)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }

                Section(header: Text("Favorite Sport").font(.headline)) {

                    Picker(selection: $user.favoriteSport, label: Text("Select Your Favorite Sport")) {
                        ForEach(User.Sport.allCases, id: \.self) { sport in
                            Text(sport.rawValue.capitalized).tag(sport)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }


            }
            .padding(.top, -170)
            .navigationBarTitle("Update Profile")
            .navigationBarItems(trailing: privacySettingsButton)
            .sheet(isPresented: $showPrivacySettings) {
                PrivacyView()
                   .environmentObject(self.userData)
            }
        }
    }
}

struct UserSettingsEditor_Previews: PreviewProvider {
    static var previews: some View {
        UserSettingsEditor(user: .constant(.default))
    }
}
