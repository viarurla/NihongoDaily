//
//  TableManager.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 10/10/2021.
//

import Foundation
import SQLite

struct TableManager {
    // Entry Tables
    let entryTable: Table = Table("entry")
    
    // Kanji Tables
    let kanjiTable = Table("kanji")
    let kanjiTagsTable = Table("kanji_tags")
    let kanjiCommonTable = Table("kanji_common")
    
    // Kana Tables
    let kanaTable = Table("kana")
    let kanaTagsTable = Table("kana_tags")
    let kanaCommonTable = Table("kana_common")
    
    // Sense Tables
    let senseTable = Table("sense")
    let partOfSpeechTable = Table("part_of_speech")
    let antonymTable = Table("antonym")
    let miscTable = Table("misc")
    let senseInfoTable = Table("sense_info")
    let langSourceTable = Table("lang_source")
    let dialectTable = Table("dialect")
    let definitionTable = Table("definition")
    
    // Generic expressions
    let id = Expression<Int>("id")
    let entryId = Expression<Int>("entry_id")
    let kanjiId = Expression<Int>("kanji_id")
    let kanaId = Expression<Int>("kana_id")
    let senseId = Expression<Int>("sense_id")
    
    let stringValue = Expression<String?>("value")
    let intValue = Expression<Int?>("value")
    
    let origin = Expression<String?>("origin")
    let type = Expression<String?>("type")
    let lang = Expression<String?>("lang")
    let wasei = Expression<String?>("wasei")
    
    let unsafeId = Expression<Int?>("id")
    
}
