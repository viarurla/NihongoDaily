//
//  NihongoDailyTests.swift
//  NihongoDailyTests
//
//  Created by Oli Jacobs on 29/09/2021.
//

import XCTest
import Gzip
import SwiftyXMLParser
import XMLMapper

@testable import NihongoDaily

class NihongoDailyTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
    }

    func testForPresenceOfSourceData() throws {
        let fileUrl = Bundle.main.url(forResource: "JMdict_e", withExtension: "gz")!
        
        var decompressedData: Data
        
        // gunzip
        let data: Data = (try Data(contentsOf: fileUrl))
        if data.isGzipped {
            decompressedData = try! data.gunzipped()
        } else {
            decompressedData = data
        }
        
        var xml = XML.parse(decompressedData)
        // access xml element
        let accessor : [SwiftyXMLParser.XML.Element] = xml["JMdict", "entry"].all!
        
        var elements: [String] = []
        
        for child: SwiftyXMLParser.XML.Element in accessor
        {
            var arrayMap: [String] = child.childElements.map {
                if $0.childElements.isEmpty {
                    return ("<\($0.name)>\($0.text ?? "")</\($0.name)>")
                }
                
                var subElements : [String] = []
                
                for subChild in $0.childElements {
                    subElements.append("<\(subChild.name)>\(subChild.text ?? "")</\(subChild.name)>")
                }
                
                return ("<\($0.name)>\(subElements.joined())</\($0.name)>")
            }
            elements.append("<entry>\(arrayMap.joined())</entry>")
        }
        
        var mapped: Entry = XMLMapper<Entry>().map(XMLString: elements[5])!
        
        print(mapped.toXMLString())
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
