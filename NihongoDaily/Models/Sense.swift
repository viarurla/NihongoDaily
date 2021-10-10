//
//  Sense.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 09/10/2021.
//

import Foundation

struct Sense {
    var id: Int?
    var entryId: Int?
    var partOfSpeech: PartOfSpeech?
    var antonym: Antonym?
    var definition: [Definition]?
    var field: Field?
    var dialect: Dialect?
    var langSource: LangSource?
    var senseInfo: [SenseInfo]?
}
