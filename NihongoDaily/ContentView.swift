//
//  ContentView.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 29/09/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Word.id, ascending: true)],
//        animation: .default)
//    private var words: FetchedResults<Word>
    var entries = PersistenceController.DatabaseManager.getEntries()
    var body: some View {
        VStack {
            Text("The word of the day is")
                .font(.largeTitle)
                .bold()
            Text(entries[120].kanji!)
                .font(.largeTitle)
            //FlashCardView()
            
        }
            .toolbar {
                #if os(iOS)
                EditButton()
                #endif

        }
        }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
