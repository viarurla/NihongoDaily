//
//  EntryDetailView.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 12/10/2021.
//

import SwiftUI

struct EntryDetail: View {
        
    @Binding var entry: Entry
    var columns = ["key", "value"]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.white)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
            VStack {
                Text("Kanji").font(.subheadline)
                ForEach(entry.kanjiList, id:\.self) { kanji in
                    if !(entry.kanjiList.isEmpty) {
                        Text(kanji)
                    }
                }
                Text(entry.kana)
                Text(entry.definition)
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

        }.frame(width: 350)
    }
}

struct EntryDetail_Previews: PreviewProvider {
    
    @State static var entry: Entry = PersistenceController.DatabaseManager.entries.first(where: {$0.id == 1002220})!

    static var previews: some View {
        EntryDetail(entry: $entry)
    }
}
