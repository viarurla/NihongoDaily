//
//  EntryListView.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 09/10/2021.
//

import SwiftUI

struct EntryListView: View {
    
    var entries: [EntryViewModel]
    
    var body: some View {
            List(entries[10...20]) { entry in
                NavigationLink(destination: EntryDetailView(entry: entry)) {
                    EntryListItemView(entry: entry)
                }
            }
            .lineLimit(2)
            .listStyle(.inset)
        
    }
    
}


struct EntryListView_Previews: PreviewProvider {
    
    static var previews: some View {
        //let entries: [Entry] = PersistenceController.DatabaseManager.getEntries()
        EntryListView(entries: PersistenceController.DatabaseManager.entries)
    }
}
