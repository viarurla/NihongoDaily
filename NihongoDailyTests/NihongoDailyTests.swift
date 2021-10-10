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
        var eManager: EntryManager = EntryManager()
        var entries: [Entry] = eManager.getEntries()
        
        var kManager: KanjiManager = KanjiManager()
        var kanjiArray = kManager.getKanjiByEntryId(entryId: 1775880)
        
        var kaManager: KanaManager = KanaManager()
        var kanaArray = kaManager.getKanaByEntryId(entryId: 1775880)

        var seManager: SenseManager = SenseManager()
        var senses = seManager.getSenseByEntryId(entryId: 1775880)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
