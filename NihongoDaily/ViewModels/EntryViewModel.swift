//
//  EntryViewModel.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 31/10/2021.
//

import Foundation

public class EntryViewModel: Identifiable, Equatable {
    
    public static func == (lhs: EntryViewModel, rhs: EntryViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    public var id: Int {
        get {
            _entry.id
        }
    }

    public var kanji: String {
        get {
            _entry.kanji.components(separatedBy: ",").first ?? ""
        }
    }
    
    public var kanjiList: [String] {
        get {
            _entry.kanji.components(separatedBy: ",")
        }
    }

    public var kana: String {
        get {
            _entry.kana.components(separatedBy: ",").first ?? ""
            
        }
    }
    
    public var kanaList: [String] {
        get {
            _entry.kana.components(separatedBy: ",")
        }
    }

    public var definition: String {
        get {
            _entry.definition.components(separatedBy: ",").first ?? "No definition."
        }
    }
    
    public var definitionList: [String] {
        get {
            _entry.definition.components(separatedBy: ",")
        }
    }

    public var misc: String {
        get {
            _entry.misc.components(separatedBy: ",").first ?? ""
        }
    }
    
    public var miscList: [String] {
        get {
            _entry.misc.components(separatedBy: ",")
        }
    }
    
    private let _entry: Entry
    
    init(entry: Entry) {
        _entry = entry
    }
    
    init() {
        _entry = Entry(id: 1003740, kanji: "", kana: "", definition: "", misc: "")
    }
    
}
