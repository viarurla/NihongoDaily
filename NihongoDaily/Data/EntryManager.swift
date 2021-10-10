//
//  EntryManager.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 09/10/2021.
//

import Foundation
import SQLite

struct EntryManager {
    
    var db = PersistenceController.DatabaseManager.database
    
    let entryTable: Table = Table("entry")
    let entryId = Expression<Int>("id")
    
    func getEntries() -> [Entry] {
        
        var entries: [Entry] = []
        do {
            for row in try db!.prepare(entryTable) {
                var entry: Entry = Entry()
                entry.id = Int(row[entryId])
                entries.append(entry)
            }
            
            return entries
        } catch {
            return []
        }
    }
    
}
