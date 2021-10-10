//
//  Entry.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 08/10/2021.
//

import Foundation

struct Entry : Identifiable {
    
    var id: Int?
    var kanji: [Kanji]?
    var kana: [Kana]?
    var sense: [Sense]?
}
