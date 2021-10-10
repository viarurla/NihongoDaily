//
//  SenseManager.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 10/10/2021.
//

import Foundation
import SQLite

struct SenseManager {
    var db = PersistenceController.DatabaseManager.database
    var tm = TableManager()
    
    func getSenseByEntryId(entryId: Int) -> [Sense] {
        do {
            var senseArray: [Sense] = []
            
            for row in try db!.prepare(tm.senseTable
                                        .filter(tm.senseTable[tm.entryId] == entryId)
                                        .join(.leftOuter, tm.senseInfoTable, on: tm.senseTable[tm.id] == tm.senseInfoTable[tm.senseId])
                                        .join(.leftOuter, tm.antonymTable, on: tm.senseTable[tm.id] == tm.antonymTable[tm.senseId])
                                        .join(.leftOuter, tm.dialectTable, on: tm.senseTable[tm.id] == tm.dialectTable[tm.senseId])
                                        .join(.leftOuter, tm.partOfSpeechTable, on: tm.senseTable[tm.id] == tm.partOfSpeechTable[tm.senseId])
                                        .join(.leftOuter, tm.langSourceTable, on: tm.senseTable[tm.id] == tm.langSourceTable[tm.senseId])
            ) {
                var sense: Sense = Sense()
                sense.id = row[tm.senseTable[tm.id]]
                sense.entryId = row[tm.senseTable[tm.entryId]]
                //sense.senseInfo = getSenseInfo(sense: sense)
                
                sense.antonym = Antonym(value:row[tm.antonymTable[tm.stringValue]] ?? "")
                
                sense.dialect = Dialect(value: row[tm.dialectTable[tm.stringValue]] ?? "")
                
                sense.partOfSpeech = PartOfSpeech(value:row[tm.partOfSpeechTable[tm.stringValue]] ?? "")
                
                sense.langSource = LangSource(
                    senseId: sense.id!,
                    origin: row[tm.origin] ?? "",
                    lang: row[tm.lang] ?? "",
                    type: row[tm.type] ?? "",
                    wasei: row[tm.wasei] ?? ""
                )
                //sense.definition = getDefinitions(sense: sense)
                senseArray.append(sense)
                
            }
            return senseArray
        } catch {
            return []
        }
    }
    
    //    private func getDefinitions(sense: Sense) -> [Definition] {
    //        let queryString: String = """
    //            select
    //                d.id,
    //                d.value,
    //                d.lang,
    //                d.type
    //            from definition d
    //            where s.sense_id = \(sense.id)
    //        """
    //
    //        var definitions: [Definition] = []
    //
    //        for row in try db.prepare(queryString) {
    //            var definition = Definition (
    //                id: row["d.id"],
    //                value: row["d.value"],
    //                lang: row["d.lang"],
    //                type: row["d.type"]
    //            )
    //            definitions.append(definition)
    //
    //        }
    //
    //        return definitions
    //
    //    }
    //
    //
    //    private func getSenseInfo(sense: Sense) -> [SenseInfo] {
    //        let queryString: String = """
    //            select
    //                si.id,
    //                si.value
    //            from sense s
    //            left join sense_info si on s.id = si.sense_id
    //            where si.entry_id = \(sense.entryId)
    //        """
    //        var senseInfoArray: [SenseInfo] = []
    //
    //        for row in try db.prepare(queryString) {
    //            var senseInfo = SenseInfo(
    //                id: row["si.id"],
    //                value: row["si.value"]
    //            )
    //            senseInfoArray.append(senseInfo)
    //
    //        }
    //
    //        return senseInfoArray
    //
    //
    //    }
}
