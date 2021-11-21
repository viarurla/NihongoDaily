//
//  DbManager.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 08/10/2021.
//

import Foundation
import SQLite
import SwiftUI

class DbManager : ObservableObject {
    
    var database: Connection?
    let tm: TableManager = TableManager()
    
    var entries: [Entry] = []
    
    init() {
        do {
            let fileURL = Bundle.main.url(forResource: "JMdict_e", withExtension: "db")!
            
            // open database
            let db = try Connection(fileURL.path)
            
            database = db
            
            setEntries()
            
        } catch {
            
        }
    }

    private func setEntries() {
        
        do {
            for row in try database!.prepare(tm.entriesView) {
                let entry: Entry = Entry(
                    id: row[tm.entryId]
                    ,kanji: row[tm.kanjiValue] ?? ""
                    ,kana: row[tm.kanaValue] ?? ""
                    ,definition: row[tm.definitionValue] ?? ""
                    ,misc: row[tm.miscValue] ?? ""
                )
                entries.append(entry)
            }
        } catch {
            // todo: Think of a better solution to this.
            entries = []
        }
    }
    
    
    
}
