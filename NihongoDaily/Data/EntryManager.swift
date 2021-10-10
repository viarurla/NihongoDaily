//
//  EntryManager.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 09/10/2021.
//

import Foundation
import SQLite3

struct EntryManager {
    
    var db = PersistenceController.DatabaseManager.database
    
    func getEntries() -> [Entry] {
        var queryStatement: OpaquePointer?
        let queryStatementString = "SELECT id FROM entry;"
        
        var entries: [Entry] = []
        
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) ==
            SQLITE_OK {
            
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                
                var entry: Entry = Entry()
                
                entry.id = Int(sqlite3_column_int(queryStatement, 0))
//                entry.kanji = String(cString:sqlite3_column_text(queryStatement, 1))
                entries.append(entry)
              
            }
            return entries
        } else {
            let errorMessage = String(cString: sqlite3_errmsg(db))
            print("\nQuery is not prepared \(errorMessage)")
        }
        sqlite3_finalize(queryStatement)
        return []
    }
    
}
