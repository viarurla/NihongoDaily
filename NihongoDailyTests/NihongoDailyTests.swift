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
        let dbm = PersistenceController.DatabaseManager
        let entries: [Entry] = dbm.getEntries()
        print(entries.count)
        //print(senses.count)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.

            
        }
    }


