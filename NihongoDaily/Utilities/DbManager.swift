//
//  DbManager.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 08/10/2021.
//

import Foundation
import SQLite3

struct DbManager {
    
    private var database: OpaquePointer?
    
    mutating func startup() {
        let fileURL = Bundle.main.url(forResource: "JMdict", withExtension: "db")!
        
        // open database
        var db: OpaquePointer?
        guard sqlite3_open(fileURL.path, &db) == SQLITE_OK else {
            print("error opening database")
            sqlite3_close(db)
            db = nil
            return
        }
        database = db!
    }
    
    func getEntries() -> [Entry] {
        var queryStatement: OpaquePointer?
        let queryStatementString = "SELECT id, kanji, reading, gloss, position FROM entry;"
        
        var entries: [Entry] = []
        
        if sqlite3_prepare_v2(database, queryStatementString, -1, &queryStatement, nil) ==
            SQLITE_OK {
            
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                
                var entry: Entry = Entry()
                
                entry.id = Int(sqlite3_column_int(queryStatement, 0))
                entry.kanji = String(cString:sqlite3_column_text(queryStatement, 1))
                entry.reading = String(cString:sqlite3_column_text(queryStatement, 2))
                entry.gloss = String(cString:sqlite3_column_text(queryStatement, 3))
                entry.position = String(cString:sqlite3_column_text(queryStatement, 4))
                
                entries.append(entry)
              
            }
            return entries
        } else {
            let errorMessage = String(cString: sqlite3_errmsg(database))
            print("\nQuery is not prepared \(errorMessage)")
        }
        sqlite3_finalize(queryStatement)
        return []
    }
    
    
    
    
}
