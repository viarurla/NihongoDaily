//
//  SettingsView.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 29/10/2021.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack {
            Spacer()
            Text("Well this is awkward, this isn't done yet...")
            Spacer()
            Button("Press to dismiss") {
                dismiss()
            }
            .controlSize(.regular)
            .font(.title)
        .buttonStyle(.borderedProminent)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
