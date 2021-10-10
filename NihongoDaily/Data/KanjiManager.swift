//
//  KanjiManager.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 09/10/2021.
//

import Foundation
import SQLite3

struct KanjiManager {
    var db = PersistenceController.entryDatabase
    
    func getKanjiByEntryId(entryId: Int) -> [Kanji] {
        
        let queryString = """
            select
                k.id as id,
                k.value as value,
                kc.id as commonId,
                kc.kanji_id as kanjiId,
                kc.value as commonValue
            from kanji k
            inner join kanji_tags kt on k.id = kt.kanji_id
            inner join kanji_common kc on k.id = kc.kanji_id
            where k.entry_id = \(entryId)
        """
        
        var kanjiArray: [Kanji] = []
        
        for row in try db.prepare(queryString) {
            
            var kanji: Kanji = Kanji()
            kanji.id = row["id"]
            kanji.value = row["value"]
            kanji.tags = getTags(kanji: kanji)
            kanji.common = KanjiCommon(
                id: row["commonId"],
                kanjiId: row["kanjiId"],
                value: row["commonId"]
            )
            kanjiArray.append(kanji)
            
        }
    }
    
    private func getTags(kanji: Kanji) -> [KanjiTag] {
        let queryString: String = """
            select
                kt.id as id,
                kt.value as value,
            from kanji_tags kt
            where kt.kanji_id = \(kanji.id)
        """
        
        var kanjiTags: [KanjiTag] = []
        
        for row in try db.prepare(queryString) {
            
            var kanjiTag = KanjiTag (
                id: row["id"],
                value: row["value"]
            )
            kanjiTags.append(kanjiTag)
        }
        
        return kanjiTags
        
    }
    
}
