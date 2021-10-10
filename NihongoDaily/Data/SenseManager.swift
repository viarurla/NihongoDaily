//
//  SenseManager.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 10/10/2021.
//

import Foundation
import SQLite3

struct SenseManager {
    var db = PersistenceController.DatabaseManager.database
    
    func getSenseByEntryId(entryId: Int) -> [Sense] {
        var queryStatement: OpaquePointer?
        let queryStatementString = """
            select
                s.id,
                s.entry_id,
                f.value,
                a.value,
                ls.lang,
                ls.origin,
                ls.type,
                ls.wasei,
                d.value,
                pos.value
            from sense s
            left join field f on s.id = f.sense_id
            left join antonym a on s.id = a.sense_id
            left join lang_source ls on s.id = ls.sense_id
            left join dialect d on s.id = d.sense_id
            left join part_of_speech pos on s.id = pos.sense_id
            where s.entry_id = \(entryId)
        """
        
        var senseArray: [Sense] = []
        
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) ==
            SQLITE_OK {
            
            while sqlite3_step(queryStatement) == SQLITE_ROW {

                var sense: Sense = Sense()
                sense.id = Int(sqlite3_column_int(queryStatement, 0))
                sense.entryId = Int(sqlite3_column_int(queryStatement, 1))
                sense.senseInfo = getSenseInfo(sense: sense)
                
                if sqlite3_column_text(queryStatement, 3) != nil
                {
                    sense.antonym = Antonym(value:String(cString:sqlite3_column_text(queryStatement, 3)))
                }
                
                if sqlite3_column_text(queryStatement, 8) != nil {
                    sense.dialect = Dialect(value:String(cString:sqlite3_column_text(queryStatement, 8)))
                }
                
                if sqlite3_column_text(queryStatement, 9) != nil {
                    sense.partOfSpeech = PartOfSpeech(value:String(cString:sqlite3_column_text(queryStatement, 9)))
                }
                
                sense.langSource = LangSource(
                    senseId: sense.id!,
                    origin: String(cString:sqlite3_column_text(queryStatement, 5)),
                    lang: String(cString:sqlite3_column_text(queryStatement, 4)),
                    type: String(cString:sqlite3_column_text(queryStatement, 6)),
                    wasei: String(cString:sqlite3_column_text(queryStatement, 7))
                )
                sense.definition = getDefinitions(sense: sense)
                senseArray.append(sense)
              
            }
            return senseArray
        } else {
            let errorMessage = String(cString: sqlite3_errmsg(db))
            print("\nQuery is not prepared \(errorMessage)")
        }
        sqlite3_finalize(queryStatement)
        return []
    }
    
    private func getDefinitions(sense: Sense) -> [Definition] {
        var queryStatement: OpaquePointer?
        let queryStatementString: String = """
            select
                d.id,
                d.value,
                d.lang,
                d.type
            from definition d
            where s.sense_id = \(sense.id)
        """
        
        var definitions: [Definition] = []
        
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) ==
            SQLITE_OK {
            
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                
                var definition = Definition (
                    id: Int(sqlite3_column_int(queryStatement, 0)),
                    value: String(cString: sqlite3_column_text(queryStatement, 1)),
                    lang: String(cString: sqlite3_column_text(queryStatement, 2)),
                    type: String(cString: sqlite3_column_text(queryStatement, 3))
                )
                definitions.append(definition)
              
            }
            
            return definitions
            
        } else {
            let errorMessage = String(cString: sqlite3_errmsg(db))
            print("\nQuery is not prepared \(errorMessage)")
        }
        sqlite3_finalize(queryStatement)
        return []
    }

    private func getSenseInfo(sense: Sense) -> [SenseInfo] {
        var queryStatement: OpaquePointer?
        let queryStatementString: String = """
            select
                si.id,
                si.value
            from sense s
            left join sense_info si on s.id = si.sense_id
            where si.entry_id = \(sense.entryId)
        """
        var senseInfoArray: [SenseInfo] = []
        
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) ==
            SQLITE_OK {
            
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                
                var senseInfo = SenseInfo(
                    id: Int(sqlite3_column_int(queryStatement, 0)),
                    value: String(cString:sqlite3_column_text(queryStatement, 1))
                )
                senseInfoArray.append(senseInfo)
              
            }
            
            return senseInfoArray
            
        } else {
            let errorMessage = String(cString: sqlite3_errmsg(db))
            print("\nQuery is not prepared \(errorMessage)")
        }
        sqlite3_finalize(queryStatement)
        return []
    }
    
}
