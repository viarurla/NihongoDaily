//
//  KanjiElement.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 03/10/2021.
//

import Foundation
import XMLMapper

class KanjiElement : XMLMappable {
    var nodeName : String!
    
    // Direct props from JMdict_e

    required init?(map: XMLMap) {}
    
    var keb : [String]?
    var keInf : String?
    var kePri : String?

    func mapping(map: XMLMap) {
//        name <- map["name"]
//        price <- map["price"]
//        description <- map["description"]
//        calories <- map["calories"]
        keb <- map["keb"]
        keInf <- map["ke_inf"]
        kePri <- map["ke_pri"]
    }
}
