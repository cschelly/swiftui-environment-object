//
//  ContactUsView.swift
//  EnvironmentObject
//
//  Created by Christina S on 12/1/19.
//  Copyright © 2019 Schelly. All rights reserved.
//

import SwiftUI

struct ContactUsView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var content = ""
    @State private var showAlert = false
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Firstname",
                        text: $name)
                    TextField("Email",
                        text: $email)
                    TextField("Message",
                        text: $content)
                    Button(action: {
                        self.showAlert.toggle()
                    }) {
                        Text("Submit")
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                            .padding()
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }.alert(isPresented: $showAlert) {
                        Alert(title: Text("Thanks!"), message: Text("We will get back to you soon"), dismissButton: .default(Text("OK")))
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                }.navigationBarTitle("Contact Us", displayMode: .inline)
            }
        }
    }
}

struct ContactUsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactUsView()
    }
}
