//
//  KanaManager.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 09/10/2021.
//

import Foundation
import SQLite3

struct KanaManager {
    var db = PersistenceController.entryDatabase
    
    func getKanaByEntryId(entryId: Int) -> [Kana] {
        
        let queryString = """
            select
                k.id as id,
                k.entry_id as entryId,
                k.value as value,
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
        
        for row in db.prepare(queryString) {
            var kana: Kana = Kana()
            kana.id = row["id"]
            kana.entryId = row["entryId"]
            kana.value = row["value"]
            
            kana.tags = getTags(kana: kana)
            
            kana.common = KanaCommon(
                id: row["kc.id"],
                kanaId: kana.id,
                value: row["kc.value"]
            )
            kanaArray.append(kana)
            
        }
        return kanaArray
    }
    
    
     func getTags(kana: Kana) -> [KanaTag] {
        
        let queryString: String = """
            select
                kt.id,
                kt.value,
            from kana_tags kt
            where kt.kana_id = \(kana.id)
        """
        
        var kanaTags: [KanaTag] = []
        
        for row in try db.prepare(queryString) {
            var kanaTag = KanaTag (
                id: row["kt.id"],
                value: row["kt.value"]
            )
            kanaTags.append(kanaTag)
            
        }
        
        return kanaTags
        
    }
    
}
