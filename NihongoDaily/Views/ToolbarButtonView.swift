//
//  ToolbarButtonView.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 14/10/2021.
//

import SwiftUI

struct ToolbarButtonView: View {
    
    var buttonName: String?
    @Binding var state: Bool
    
    var body: some View {
        Button(action: {
            state.toggle()
        }) {
            Text(buttonName ?? "")
                .font(.system(size: 18))
        }
        .buttonStyle(.bordered)
        //.controlSize(.large)

    }
}

struct ToolbarButtonView_Previews: PreviewProvider {
    
    @State static var testState = false
    
    static var previews: some View {
        ToolbarButtonView(buttonName: "Hello there", state: $testState)
    }
}
