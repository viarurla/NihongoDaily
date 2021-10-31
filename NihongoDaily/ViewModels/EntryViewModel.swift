//
//  EntryViewModel.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 31/10/2021.
//

import Foundation

public class EntryViewModel: Identifiable {
    
    public var id: Int
    
    var kanji: String
    
    var kana: String
    
    var definition: String
    
    var misc: String
    
    
    private let entry: Entry
    
    init(entry: Entry) {
        self.entry = entry
        self.id = entry.id
        self.kanji = entry.kanji
        self.kana = entry.kana
        self.definition = entry.definition
        self.misc = entry.misc
    }
    
}
