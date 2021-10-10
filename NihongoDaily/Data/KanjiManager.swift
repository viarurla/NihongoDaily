//
//  KanjiManager.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 09/10/2021.
//

import Foundation
import SQLite

struct KanjiManager {
    var db = PersistenceController.DatabaseManager.database
    let tm = TableManager()
    
    func getKanjiByEntryId(entryId: Int) -> [Kanji] {
        do {
        var kanjiArray: [Kanji] = []
        
        for row in try db!.prepare(
            tm.kanjiTable
                .filter(tm.entryId == entryId)
                .join(.leftOuter, tm.kanjiCommonTable, on: tm.kanjiTable[tm.id] == tm.kanjiCommonTable[tm.kanjiId]))
            {
            
            var kanji: Kanji = Kanji()
            kanji.id = row[tm.kanjiTable[tm.id]]
            kanji.value = row[tm.kanjiTable[tm.stringValue]]
//            kanji.tags = getTags(kanji: kanji)
            if row[tm.kanjiCommonTable[tm.unsafeId]] != nil {
            kanji.common = KanjiCommon(
                id: row[tm.kanjiCommonTable[tm.id]],
                kanjiId: row[tm.kanjiId],
                value: row[tm.kanjiCommonTable[tm.stringValue]] ?? ""
            )
                
            }
            kanjiArray.append(kanji)
            
        }
        return kanjiArray
        } catch {
            return []
        }
    }
    
//    private func getTags(kanji: Kanji) -> [KanjiTag] {
//        let queryString: String = """
//            select
//                kt.id as id,
//                kt.value as value,
//            from kanji_tags kt
//            where kt.kanji_id = \(kanji.id)
//        """
//
//        var kanjiTags: [KanjiTag] = []
//
//        for row in try db.prepare(queryString) {
//
//            var kanjiTag = KanjiTag (
//                id: row["id"],
//                value: row["value"]
//            )
//            kanjiTags.append(kanjiTag)
//        }
//
//        return kanjiTags
//
//    }
    
}
