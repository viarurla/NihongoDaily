//
//  EntryDetailView.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 12/10/2021.
//

import SwiftUI

struct EntryDetailView: View {
        
    @Binding var entry: EntryViewModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.white)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
            VStack {
                Text(entry.kanji)
                Text(entry.kana)
                Text(entry.definition)
                Text(entry.misc)
                ForEach(entry.miscList, id:\.self) { misc in
                    if !(misc.isEmpty) {
                        Text(misc)
                    }
                }
                // Kana
                ForEach(entry.kanaList, id:\.self) { kana in
                    Text(kana)
                }
            }.colorScheme(.light)
                .padding(10)
                .multilineTextAlignment(.center)

        }.padding()
    }
}

struct EntryDetailView_Previews: PreviewProvider {
    
    @State static var entry: EntryViewModel = PersistenceController.DatabaseManager.entries[1234]

    static var previews: some View {
        EntryDetailView(entry: $entry)
    }
}
