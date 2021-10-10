//
//  EntryManager.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 09/10/2021.
//

import Foundation
import SQLite

struct EntryManager {
    
    var db = PersistenceController.entryDatabase
    
    func getEntries() -> [Entry] {
        
        var entries: [Entry] = []
        do {
            for row in try db.prepare("SELECT id FROM entry;") {
                var entry: Entry = Entry()
                entry.id = Int(row["id"])
                entries.append(entry)
            }
            
            return entries
        } catch {
            return []
        }
    }
    
}
