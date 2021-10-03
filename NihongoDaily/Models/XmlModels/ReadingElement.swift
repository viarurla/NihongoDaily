//
//  ReadingElement.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 03/10/2021.
//

import Foundation
import XMLMapper

class ReadingElement : XMLMappable {
    var nodeName : String!
    
    // Direct props from JMdict_e

    required init?(map: XMLMap) {}
    
    var reb : [String]?

    func mapping(map: XMLMap) {
//        name <- map["name"]
//        price <- map["price"]
//        description <- map["description"]
//        calories <- map["calories"]
        reb <- map["reb"]
    }
}
