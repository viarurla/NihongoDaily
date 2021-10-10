//
//  SenseManager.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 10/10/2021.
//

import Foundation
import SQLite

struct SenseManager {
    var db = PersistenceController.entryDatabase
    
    func getSenseByEntryId(entryId: Int) -> [Sense] {
        
        let senseTable = Table("Sense")
        let id = Expression<Int>("id")
        
        let queryString = """
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
        
        for row in db.prepare(queryString) {
            var sense: Sense = Sense()
            sense.id = row["s.id"]
            sense.entryId = Int(row["s.entry_id"])
            sense.senseInfo = getSenseInfo(sense: sense)
            
            sense.antonym = Antonym(value:row["a.value"])
            
            sense.dialect = Dialect(value: row["d.value"])
            
            sense.partOfSpeech = PartOfSpeech(value:row["pos.value"])
            
            sense.langSource = LangSource(
                senseId: sense.id!,
                origin: row["ls.origin"],
                lang: row["ls.lang"],
                type: row["ls.type"],
                wasei: row["ls.wasei"]
            )
            sense.definition = getDefinitions(sense: sense)
            senseArray.append(sense)
            
        }
        return senseArray
        
    }
    
    private func getDefinitions(sense: Sense) -> [Definition] {
        let queryString: String = """
            select
                d.id,
                d.value,
                d.lang,
                d.type
            from definition d
            where s.sense_id = \(sense.id)
        """
        
        var definitions: [Definition] = []
        
        for row in try db.prepare(queryString) {
            var definition = Definition (
                id: row["d.id"],
                value: row["d.value"],
                lang: row["d.lang"],
                type: row["d.type"]
            )
            definitions.append(definition)
            
        }
        
        return definitions
        
    }
    
    
    private func getSenseInfo(sense: Sense) -> [SenseInfo] {
        let queryString: String = """
            select
                si.id,
                si.value
            from sense s
            left join sense_info si on s.id = si.sense_id
            where si.entry_id = \(sense.entryId)
        """
        var senseInfoArray: [SenseInfo] = []
        
        for row in try db.prepare(queryString) {
            var senseInfo = SenseInfo(
                id: row["si.id"],
                value: row["si.value"]
            )
            senseInfoArray.append(senseInfo)
            
        } 
        
        return senseInfoArray
        
        
    }
}
