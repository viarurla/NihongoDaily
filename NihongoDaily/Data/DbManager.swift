//
//  DbManager.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 08/10/2021.
//

import Foundation
import SQLite

struct DbManager {
    
    var database: Connection?
    
    mutating func startup() {
        do {
            let fileURL = Bundle.main.url(forResource: "JMdict_e", withExtension: "db")!
            
            // open database
            let db = try Connection(fileURL.path)

            database = db
        } catch {
            
        }
    }

    
}
