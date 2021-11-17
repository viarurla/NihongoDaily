//
//  NihongoDailyApp.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 29/09/2021.
//

import SwiftUI

@main
struct NihongoDailyApp: App {
    let persistenceController = PersistenceController.shared
    
    
    var body: some Scene {
        WindowGroup {
            NihongoDailyView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
