//
//  FlashCard.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 29/09/2021.
//

import SwiftUI

struct FlashCardView: View {
    
    @Binding var entry: EntryViewModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.white)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
            VStack {
                Text(entry.kana)
                    .font(.headline).bold().padding()
                Divider()
                Text(entry.definition)
                Text(entry.kanji)
                Text(entry.misc)
            }.colorScheme(.light)
            .padding(10)
            .multilineTextAlignment(.center)
        }
        .frame(width: 350, height: 250)
    }
}

struct FlashCardView_Previews: PreviewProvider {

    @State static var entry: EntryViewModel = PersistenceController.DatabaseManager.entries[10]
    
    static var previews: some View {
        FlashCardView(entry: $entry)
    }
}
