//
//  PrimaryBtn.swift
//  NihongoDaily
//
//  Created by Oliver Jacobs on 21/11/2021.
//

import Foundation
import SwiftUI

struct PrimaryBtnStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(15.0)
            .scaleEffect(configuration.isPressed ? 1.1 : 1.0)
        
    }
}
