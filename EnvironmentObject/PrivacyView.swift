//
//  PrivacyView.swift
//  EnvironmentObject
//
//  Created by Christina S on 12/1/19.
//  Copyright © 2019 Schelly. All rights reserved.
//

import SwiftUI

struct PrivacyView: View {
    @EnvironmentObject var userData: UserData
    @State private var showPreferences = false
    var body: some View {
        NavigationView {
            VStack {
                Text(PrivacyConstants.content)
                    .padding()
                HStack {
                    Text("Adjust your privacy preferences")
                        .font(.caption)
                    Button(action: {
                        self.showPreferences.toggle()
                    }) {
                        Text("here")
                            .font(.caption)
                            .padding(.leading, -4)
                    }.sheet(isPresented: $showPreferences) {
                        ConsentPreferencesView()
                            .environmentObject(self.userData)
                    }
                }
            }
            .navigationBarTitle("Privacy")
        }
    }
}

struct ConsentPreferencesView: View {
    @Environment(\.editMode) var mode
    @EnvironmentObject var userData: UserData
    @State var draftPrivacySettings = PrivacySettings.default
    
    var body: some View {
        return NavigationView {
            Form {
                Text("You have currently selected \"\(userData.privacySettings.trackingConsent.rawValue)\" for your tracking preference. Tap the 'Edit' button to make changes.")
                Section(header: Text("Overall Tracking Preference").font(.headline)) {
                    Toggle(isOn: $userData.privacySettings.consented) { Text(userData.privacySettings.trackingConsent.rawValue.capitalized)
                    }
                }
                Section {
                    List {
                        ForEach(userData.privacySettings.trackingCategories,
                             id: \.self) { category in
                            Text(category.rawValue.capitalized)
                        }
                        .onDelete(perform: delete)
                    }

                }
            }
            .navigationBarTitle("Privacy Settings").padding(.top, 20)
            .navigationBarItems(trailing: EditButton().font(.headline))
        }
    }
    
    func delete(at offsets: IndexSet) {
        userData.privacySettings.trackingCategories.remove(atOffsets: offsets)
        userData.privacySettings.updatePreferences(true)
    }
    
}

struct PrivacyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyView()
    }
}
