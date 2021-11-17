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
    // todo: remove and put inside of a new viewmodel
    var formatter = CommonFormatter()
    
    var body: some View {
        VStack {
            NavigationView {
                List(records, id: \.self) { record in
                    HStack {
                        Text(formatter.formatDate(date: record.recordDate!))
                        Text("Entry ID: \(record.entryId)")
                    }
                }.navigationTitle("History").navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
