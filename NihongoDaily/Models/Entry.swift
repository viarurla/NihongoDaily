//
//  Entry.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 08/10/2021.
//

import Foundation

struct Entry : Identifiable, Equatable {
    
    private var _id: Int
    private var _kanji: String
    private var _kana: String
    private var _definition: String
    private var _misc: String
    
    public var id: Int {
        get {
            _id
        }
    }

    public var kanji: String {
        get {
            _kanji.components(separatedBy: ",").first ?? ""
        }
    }
    
    public var kanjiList: [String] {
        get {
            _kanji.components(separatedBy: ",")
        }
    }

    public var kana: String {
        get {
            _kana.components(separatedBy: ",").first ?? ""
            
        }
    }
    
    public var kanaList: [String] {
        get {
            _kana.components(separatedBy: ",")
        }
    }

    public var definition: String {
        get {
            _definition.components(separatedBy: ",").first ?? "No definition."
        }
    }
    
    public var definitionList: [String] {
        get {
            _definition.components(separatedBy: ",")
        }
    }

    public var misc: String {
        get {
            _misc.components(separatedBy: ",").first ?? ""
        }
    }
    
    public var miscList: [String] {
        get {
            _misc.components(separatedBy: ",")
        }
    }
    
    
    init(id: Int, kanji: String, kana: String, definition: String, misc: String) {
        _id = id
        _kanji = kanji
        _kana = kana
        _definition = definition
        _misc = misc
    }
    
    // Default entry initialiser, will think of a better solution at a later date.
    init() {
        _id = 1003740
        _kanji = ""
        _kana = ""
        _definition = ""
        _misc = ""
    }
    
}
