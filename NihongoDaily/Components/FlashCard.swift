//
//  FlashCard.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 29/09/2021.
//

import SwiftUI

struct FlashCard: View {
    
    @Binding var entry: Entry
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.white)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
            VStack {
                Text(entry.kana)
                    .font(.title).bold().padding()
//                Divider()
//                Text(entry.definition)
//                Text(entry.kanji)
//                Text(entry.misc)
            }.colorScheme(.light)
            .padding(10)
            .multilineTextAlignment(.center)
        }
        .frame(width: 350, height: 150)
    }
}

struct FlashCardView_Previews: PreviewProvider {

    @State static var entry: Entry = PersistenceController.DatabaseManager.entries[10]
    
    static var previews: some View {
        FlashCard(entry: $entry)
    }
}
