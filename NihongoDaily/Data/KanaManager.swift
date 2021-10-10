//
//  KanaManager.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 09/10/2021.
//

import Foundation
import SQLite3

struct KanaManager {
    var db = PersistenceController.DatabaseManager.database
    
    func getKanaByEntryId(entryId: Int) -> [Kana] {
        var queryStatement: OpaquePointer?
        let queryStatementString = """
            select
                k.id,
                k.entry_id,
                k.value,
                k.no_kanji,
                kt.id,
                kt.value,
                kc.id,
                kc.value
            from kana k
            left join kana_tags kt on k.id = kt.kana_id
            left join kana_common kc on k.id = kc.kana_id
            where k.entry_id = \(entryId)
        """
        
        var kanaArray: [Kana] = []
        
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) ==
            SQLITE_OK {
            
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                
                var kana: Kana = Kana()
                kana.id = Int(sqlite3_column_int(queryStatement, 0))
                kana.entryId = Int(sqlite3_column_int(queryStatement, 1))
                kana.value = String(cString:sqlite3_column_text(queryStatement, 2))
                
                kana.tags = getTags(kana: kana)
                
//                kana.common = KanaCommon(
//                    id: Int(sqlite3_column_int(queryStatement, 6)),
//                    kanaId: Int(sqlite3_column_int(queryStatement, 7)),
//                    value: String(cString:sqlite3_column_text(queryStatement, 8))
//                )
                kanaArray.append(kana)
              
            }
            return kanaArray
        } else {
            let errorMessage = String(cString: sqlite3_errmsg(db))
            print("\nQuery is not prepared \(errorMessage)")
        }
        sqlite3_finalize(queryStatement)
        return []
    }
    
    private func getTags(kana: Kana) -> [KanaTag] {
        var queryStatement: OpaquePointer?
        let queryStatementString: String = """
            select
                kt.id,
                kt.value,
            from kana_tags kt
            where kt.kana_id = \(kana.id)
        """
        
        var kanaTags: [KanaTag] = []
        
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) ==
            SQLITE_OK {
            
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                
                var kanaTag = KanaTag (
                    id: Int(sqlite3_column_int(queryStatement, 0)),
                    value: String(cString: sqlite3_column_text(queryStatement, 1))
                )
                kanaTags.append(kanaTag)
              
            }
            
            return kanaTags
            
        } else {
            let errorMessage = String(cString: sqlite3_errmsg(db))
            print("\nQuery is not prepared \(errorMessage)")
        }
        sqlite3_finalize(queryStatement)
        return []
    }

}
