//
//  UserSettingsHost.swift
//  EnvironmentObject
//
//  Created by Christina S on 12/7/19.
//  Copyright © 2019 Schelly. All rights reserved.
//

import SwiftUI

struct UserSettingsHost: View {
    @Environment(\.editMode) var mode
    @EnvironmentObject var userData: UserData
    @State var draftProfile = User.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if self.mode?.wrappedValue == .active {
                    Button("Cancel") {
                        self.draftProfile = self.userData.user
                        self.mode?.animation().wrappedValue = .inactive
                    }
                }
                
                Spacer()
                
                EditButton()
            }
            if self.mode?.wrappedValue == .inactive {
                UserSettingsSummary(user: userData.user)
            } else {
                UserSettingsEditor(user: $draftProfile)
                    .onAppear {
                        self.draftProfile = self.userData.user
                    }
                    .onDisappear {
                        self.userData.user = self.draftProfile
                        self.userData.calculateNerdLevel(basedOn: self.userData.user)
                    }
            }
        }
        .padding()
    }
}

struct UserSettingsHost_Previews: PreviewProvider {
    static var previews: some View {
        UserSettingsHost().environmentObject(UserData())
    }
}
