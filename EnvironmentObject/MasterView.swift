//
//  MasterView.swift
//  EnvironmentObject
//
//  Created by Christina S on 11/24/19.
//  Copyright © 2019 Schelly. All rights reserved.
//

import SwiftUI


struct MasterView: View {
    @EnvironmentObject var userData: UserData
    var body: some View {
        VStack {
            if !userData.isLoggedIn {
                SignInView()
            } else {
                TabbedView()
            }
        }
    }
}

struct TabbedView: View {
    var body: some View {
        TabView {
            NewsFeedView()
                .tabItem {
                    Image(systemName: "dot.radiowaves.left.and.right")
                    Text("Nerd News")
            }
            NerdStatusView()
                .tabItem {
                    Image(systemName: "eyeglasses")
                    Text("Nerd Status")
            }

            ContactUsView()
                .tabItem {
                    Image(systemName: "message.fill")
                    Text("Contact")
            }
        }
    }
}

struct NewsFeedView: View {
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundImage(opacity: 0.3)
                ScrollView {
                    ForEach(0..<NewsFeedConstants.content.count, id: \.self) { index in
                        VStack {
                            Text("\(NewsFeedConstants.titles[index])")
                                .font(.headline)
                                .padding()
                            Text("\(NewsFeedConstants.content[index])")
                                .padding()
                        }.padding()
                    }.navigationBarTitle("Nerd News", displayMode: .inline)
                }
            }
        }
    }
}


struct NerdStatusView: View {
    @EnvironmentObject var userData: UserData
    @State private var showSettings = false
    
    var settingsButton: some View {
        Button(action: { self.showSettings.toggle() }) {
            Image(systemName: "gear")
                .imageScale(.large)
                .accessibility(label: Text("User Settings"))
                .padding()
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundImage(opacity: 0.4)
                VStack(spacing: 20.0) {
                    Text("Hello, \(userData.user.firstName)!")
                        .multilineTextAlignment(.center)
                        .font(.largeTitle)
                    Text("Based on our calculation, you are \n\(userData.user.nerdStatus.nerdLevel.title)")
                        .font(.body)
                        .multilineTextAlignment(.center)
                    GraphView(percentage: $userData.nerdLevelPercentage)
                        .padding(.top, 10)
                    Image(userData.user.nerdStatus.nerdLevel.image)
                        .multilineTextAlignment(.center)
                        .navigationBarTitle("Nerd Status", displayMode: .inline)
                        .padding(.top, 50)
                    Spacer()

                }.padding(.top, 20)
            }
            .navigationBarItems(trailing: settingsButton)
            .sheet(isPresented: $showSettings) {
                UserSettingsHost()
                    .environmentObject(self.userData)
            }
        }.onAppear {
            self.userData.calculateNerdLevel(basedOn: self.userData.user)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NerdStatusView().environmentObject(UserData())
    }
}

