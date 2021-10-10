//
//  KanaManager.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 09/10/2021.
//

import Foundation
import SQLite

struct KanaManager {
    var db = PersistenceController.DatabaseManager.database
    var tm = TableManager()
    
    func getKanaByEntryId(entryId: Int) -> [Kana] {
        do {
            var kanaArray: [Kana] = []
            
            for row in try db!.prepare(tm.kanaTable
                                        .filter(tm.kanaTable[tm.entryId] == entryId)
                                        .join(.leftOuter, tm.kanaCommonTable, on: tm.kanaTable[tm.id] == tm.kanaCommonTable[tm.kanaId]))
            {
                var kana: Kana = Kana()
                kana.id = row[tm.kanaTable[tm.id]]
                kana.entryId = row[tm.entryId]
                kana.value = row[tm.kanaTable[tm.stringValue]]
                
                //kana.tags = getTags(kana: kana)
                if row[tm.kanaCommonTable[tm.unsafeId]] != nil {
                kana.common = KanaCommon(
                    id: row[tm.kanaCommonTable[tm.id]],
                    kanaId: row[tm.kanaId],
                    value: row[tm.kanaCommonTable[tm.stringValue]] ?? ""
                )
                kanaArray.append(kana)
                }
            }
            return kanaArray
        } catch {
            return []
        }
    }
    
    
    //     func getTags(kana: Kana) -> [KanaTag] {
    //
    //        let queryString: String = """
    //            select
    //                kt.id,
    //                kt.value,
    //            from kana_tags kt
    //            where kt.kana_id = \(kana.id)
    //        """
    //
    //        var kanaTags: [KanaTag] = []
    //
    //        for row in try db.prepare(queryString) {
    //            var kanaTag = KanaTag (
    //                id: row["kt.id"],
    //                value: row["kt.value"]
    //            )
    //            kanaTags.append(kanaTag)
    //
    //        }
    //
    //        return kanaTags
    //
}


