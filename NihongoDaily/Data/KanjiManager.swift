//
//  KanjiManager.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 09/10/2021.
//

import Foundation
import SQLite3

struct KanjiManager {
    var db = PersistenceController.DatabaseManager.database
    
    func getKanjiByEntryId(entryId: Int) -> [Kanji] {
        var queryStatement: OpaquePointer?
        let queryStatementString = """
            select
                k.id,
                k.value,
                kt.id,
                kt.value,
                kc.id,
                kc.kanji_id
                kc.value
            from kanji k
            inner join kanji_tags kt on k.id = kt.kanji_id
            inner join kanji_common kc on k.id = kc.kanji_id
            where k.entry_id = \(entryId)
        """
        
        var kanjiArray: [Kanji] = []
        
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) ==
            SQLITE_OK {
            
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                
                var kanji: Kanji = Kanji()
                kanji.id = Int(sqlite3_column_int(queryStatement, 0))
                kanji.value = String(cString:sqlite3_column_text(queryStatement, 1))
                kanji.tags = getTags(kanji: kanji)
                kanji.common = KanjiCommon(
                    id: Int(sqlite3_column_int(queryStatement, 4)),
                    kanjiId: Int(sqlite3_column_int(queryStatement, 5)),
                    value: String(cString:sqlite3_column_text(queryStatement, 6))
                )
                kanjiArray.append(kanji)
              
            }
            return kanjiArray
        } else {
            let errorMessage = String(cString: sqlite3_errmsg(db))
            print("\nQuery is not prepared \(errorMessage)")
        }
        sqlite3_finalize(queryStatement)
        return []
    }

    private func getTags(kanji: Kanji) -> [KanjiTag] {
        var queryStatement: OpaquePointer?
        let queryStatementString: String = """
            select
                kt.id,
                kt.value,
            from kanji_tags kt
            where kt.kanji_id = \(kanji.id)
        """
        
        var kanjiTags: [KanjiTag] = []
        
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) ==
            SQLITE_OK {
            
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                
                var kanjiTag = KanjiTag (
                    id: Int(sqlite3_column_int(queryStatement, 0)),
                    value: String(cString: sqlite3_column_text(queryStatement, 1))
                )
                kanjiTags.append(kanjiTag)
              
            }
            
            return kanjiTags
            
        } else {
            let errorMessage = String(cString: sqlite3_errmsg(db))
            print("\nQuery is not prepared \(errorMessage)")
        }
        sqlite3_finalize(queryStatement)
        return []
    }
    
}
