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
        let eManager: EntryManager = EntryManager()
        let entries: [Entry] = eManager.getEntries()
        print(entries.count)
        
        let kManager: KanjiManager = KanjiManager()
        let kanjiArray = kManager.getKanjiByEntryId(entryId: 1775880)
        print(kanjiArray.count)
        
        let kaManager: KanaManager = KanaManager()
        let kanaArray = kaManager.getKanaByEntryId(entryId: 1775880)
        print(kanaArray.count)

        let seManager: SenseManager = SenseManager()
        let senses = seManager.getSenseByEntryId(entryId: 1775880)
        //print(senses.count)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
            var eManager = EntryManager()
            var kanjiManager = KanjiManager()
            var kanaManager = KanaManager()
            var senseManager = SenseManager()
            
            var entries: [Entry] = eManager.getEntries()
            var processedEntries = [Entry]()
            
            for entry in entries[0...100] {
                var processedEntry = Entry()
                processedEntry.kanji = kanjiManager.getKanjiByEntryId(entryId: entry.id!)
                processedEntry.kana = kanaManager.getKanaByEntryId(entryId: entry.id!)
                processedEntry.sense = senseManager.getSenseByEntryId(entryId: entry.id!)
                //print("Processed entry with ID: \(entry.id!)")
                processedEntries.append(processedEntry)
            
        }
    }

}
