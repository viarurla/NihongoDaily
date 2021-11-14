//
//  SettingsView.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 29/10/2021.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    var settings: [String] = ["Filters", "About", "Misc"]
    
    var body: some View {
        
        NavigationView {
            VStack {
                Spacer()
                Text("Well this is awkward, this isn't done yet...")
                //                List(settings, id: \.self) { entry in
                //                    NavigationLink(destination: AboutView()) {
                //                        Text(entry)
                //                    }
                //                }
                //                .listStyle(.inset)
                Spacer()
                Button("dismiss") {
                    dismiss()
                }
                .font(.title)
                .buttonStyle(.borderedProminent)
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
