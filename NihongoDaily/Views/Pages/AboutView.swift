//
//  AboutView.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 27/10/2021.
//

import SwiftUI

struct AboutView: View {
    
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

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
