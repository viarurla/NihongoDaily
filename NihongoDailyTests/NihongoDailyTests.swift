//
//  NihongoDailyTests.swift
//  NihongoDailyTests
//
//  Created by Oli Jacobs on 29/09/2021.
//

import XCTest

@testable import NihongoDaily

class NihongoDailyTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let fileUrl = Bundle.main.url(forResource: "jmdict-eng-3.1.0", withExtension: "json")!
        let fileContents = try? String(contentsOf: fileUrl)
        let data = Data(fileContents!.utf8)
        let json = try? JSONSerialization.jsonObject(with: data, options: [])
        print(json)

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
