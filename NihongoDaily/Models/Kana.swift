//
//  Kana.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 09/10/2021.
//

import Foundation

struct Kana {
    var id: Int?
    var entryId: Int?
    var value: String?
    var noKanji: Bool?
    var tags: [KanaTag]?
    var common: KanaCommon?
}
