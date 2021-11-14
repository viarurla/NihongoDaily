//
//  HistoryView.swift
//  NihongoDaily
//
//  Created by Oliver Jacobs on 14/11/2021.
//

import SwiftUI
import CoreData

struct HistoryView: View {
    
//    @FetchRequest(
//        entity: User.entity(),
//        sortDescriptors: []
//    ) var users: FetchedResults<User>
    
    // todo: need a viewmodel for this
    
    @FetchRequest(entity: HistoryRecord.entity(), sortDescriptors: [])
    var records: FetchedResults<HistoryRecord>
    
    var body: some View {
        VStack {
            NavigationView {
                List(records, id: \.self) { record in
                    HStack {
                        Text((record.recordDate?.ISO8601Format())!)
                        Text("Entry ID: \(record.entryId)")
                    }
                }.navigationTitle("History")
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
