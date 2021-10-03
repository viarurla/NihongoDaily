//
//  Entry.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 02/10/2021.
//

import Foundation
import XMLMapper

class Entry : XMLMappable {
    
    var nodeName: String!
    
    // Direct props from JMdict_e

    var entSeq: Int!
    var kEle: KanjiElement?
    var rEle: ReadingElement?
    var sense: [Sense]?
    
    required init?(map: XMLMap) {}
    
    func mapping(map: XMLMap) {
        
        entSeq <- map["ent_seq"]
        kEle <- map["k_ele"]
        rEle <- map["r_ele"]
        sense <- map["sense"]
        
    }
    
    
}
