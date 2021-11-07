//
//  ContentViewModel.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 31/10/2021.
//

import Foundation
import SwiftUI
import CoreData

public class ContentViewModel: ObservableObject {
    @Published var showSettingsView: Bool = false
    @Published var currentEntry: EntryViewModel = EntryViewModel()
    
    @FetchRequest(entity: HistoryRecord.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \HistoryRecord.recordDate, ascending: false)
    ])
    var records: FetchedResults<HistoryRecord>
    var moc: NSManagedObjectContext
    
    init(moc: NSManagedObjectContext) {
        
        self.moc = moc
        
        if (records.count > 0) {
            // If enough time has passed since the last entry, refresh.
            let latestRecord = records.first
            if (latestRecord!.recordDate! < Date()) {
                getNewEntry()
            }
            currentEntry = PersistenceController.DatabaseManager.entries.first(where: {$0.id == records.first!.entryId}) ?? EntryViewModel()
            
        } else {
            getNewEntry()
        }
        

    }
    
    public func getNewEntry() {
        do {
            let record = HistoryRecord(context: self.moc)
            record.entryId = Int64(PersistenceController.DatabaseManager.entries.shuffled().first!.id)
            currentEntry = PersistenceController.DatabaseManager.entries.first(where: { $0.id == record.entryId } )!
            try self.moc.save()
            
        }
        catch {
            print(error)
        }
        
    }
    
}
