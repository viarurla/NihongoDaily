//
//  ContentViewModel.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 31/10/2021.
//

import Foundation
import SwiftUI

public class ContentViewModel: ObservableObject {
    
    @Published var showHomeView: Bool = false
    @Published var currentEntry: EntryViewModel
    
    private var entries: [EntryViewModel]
        
    init() {
        entries = PersistenceController.DatabaseManager.entries
        currentEntry = entries.shuffled().first!
    }
    
    public func getNewEntry() {
        self.currentEntry =  entries.shuffled().first!
    }
    
}
