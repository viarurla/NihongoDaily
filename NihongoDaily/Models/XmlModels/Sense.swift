//
//  Sense.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 02/10/2021.
//

import Foundation
import XMLMapper

class Sense : XMLMappable {
    var nodeName : String!
    
    // Direct props from JMdict_e

    required init?(map: XMLMap) {}
    
    var pos: String?
    var xRef: String?
    var misc: String?
    var senseInformation: String?
    var glossary: [String]?


    func mapping(map: XMLMap) {

        pos <- map["pos"]
        xRef <- map["xref"]
        misc <- map["misc"]
        senseInformation <- map["s_inf"]
        glossary <- map["gloss"]

    }
}

