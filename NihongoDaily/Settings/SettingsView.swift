//
//  SettingsView.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 29/10/2021.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) var dismiss
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
                Button("dismiss") {
                    dismiss()
                }
                .font(.title)
                .buttonStyle(.borderedProminent)
            }
            .navigationBarTitle("Settings").navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
