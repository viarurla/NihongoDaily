//
//  ContentView.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 29/09/2021.
//

import SwiftUI
import CoreData

struct NihongoDailyView: View {
    @StateObject var contentViewModel = ContentViewModel(moc: PersistenceController.shared.container.viewContext)

    var body: some View {
        NavigationView {
            VStack {
                FlashCard(entry: $contentViewModel.currentEntry)
                EntryDetail(entry: $contentViewModel.currentEntry)
            }
            .navigationBarTitle("Word of the day", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Button(action: {
                            contentViewModel.getNewEntry()
                        }) {
                            Text("new word").font(.system(size: 18))
                        }
                        .buttonStyle(.bordered)
                        ToolbarButton(buttonName: "settings", state: $contentViewModel.showSettingsView)
                    }
                    .sheet(isPresented: $contentViewModel.showSettingsView) {
                        SettingsView().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
                    }
                }
            }
        }
    }
    
    struct NihongoDailyView_Previews: PreviewProvider {
        static var previews: some View {
            NihongoDailyView().preferredColorScheme(.dark)
        }
    }
}
