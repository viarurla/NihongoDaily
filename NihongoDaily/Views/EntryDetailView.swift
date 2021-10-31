//
//  EntryDetailView.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 12/10/2021.
//

import SwiftUI

struct EntryDetailView: View {
        
    var entry: EntryViewModel
    
    var body: some View {
        VStack {
            Text(entry.kanji)
            Text(entry.kana)
            Text(entry.definition)
            Text(entry.misc)
        }
    }
}

struct EntryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EntryDetailView(entry: PersistenceController.DatabaseManager.entries[10])
    }
}
