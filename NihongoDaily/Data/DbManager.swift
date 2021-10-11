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
    let tm: TableManager = TableManager()
    
    mutating func startup() {
        do {
            let fileURL = Bundle.main.url(forResource: "JMdict_e", withExtension: "db")!
            
            // open database
            let db = try Connection(fileURL.path)

            database = db
        } catch {
            
        }
    }

    func getEntries() -> [Entry] {
        
        var entries: [Entry] = []
        do {
            for row in try database!.prepare(tm.entryTable

                                                .select(
                                                    tm.entryTable[tm.id],
                                                    tm.kanaTable[tm.stringValue],
                                                    tm.kanaAppliesToKanjiTable[tm.stringValue],
                                                    tm.definitionTable[tm.stringValue]
                                                )
                                                .join(.leftOuter, tm.kanaTable, on: tm.entryTable[tm.id] == tm.kanaTable[tm.entryId])
                                                .join(.leftOuter, tm.kanaAppliesToKanjiTable, on: tm.kanaTable[tm.id] == tm.kanaAppliesToKanjiTable[tm.kanaId])
                                                .join(.leftOuter, tm.senseTable, on: tm.senseTable[tm.entryId] == tm.entryTable[tm.id])
                                                .join(.leftOuter, tm.definitionTable, on: tm.definitionTable[tm.senseId] == tm.senseTable[tm.id])
                                                .group(tm.entryTable[tm.id]) // DB Concat doesn't exist, we lose information like this.
                                                
            ) {
                var entry: Entry = Entry()
                entry.id = row[tm.entryTable[tm.id]]
                entry.kana = row[tm.kanaTable[tm.stringValue]] ?? ""
                entry.kanji = row[tm.kanaAppliesToKanjiTable[tm.stringValue]] ?? ""
                entry.definition = row[tm.definitionTable[tm.stringValue]] ?? ""
                entries.append(entry)
            }
            
            return entries
        } catch {
            return []
        }
    }

    
}
