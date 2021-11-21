//
//  SettingsView.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 29/10/2021.
//

import SwiftUI

struct SettingsView: View {
    
    var settingsViewModel = SettingsViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack {
                Spacer()
                List(settingsViewModel.settings, id: \.id) { entry in
                    NavigationLink(destination: entry.view) {
                        Text(entry.name)
                    }
                }
                .listStyle(.inset)
                Spacer()
                .font(.title)
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
