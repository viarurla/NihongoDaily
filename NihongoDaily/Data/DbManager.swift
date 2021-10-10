//
//  DbManager.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 08/10/2021.
//

import Foundation
import SQLite3

struct DbManager {
    
    var database: OpaquePointer?
    
    mutating func startup() {
        let fileURL = Bundle.main.url(forResource: "JMdict_e", withExtension: "db")!
        
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

    
}
