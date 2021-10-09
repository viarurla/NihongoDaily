//
//  FlashCard.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 29/09/2021.
//

import SwiftUI

struct FlashCardView: View {
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.white)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
            VStack {
                Text("Placeholder")
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 350, height: 250)
    }
}

struct FlashCardView_Previews: PreviewProvider {

    static var previews: some View {
        FlashCardView()
    }
}
