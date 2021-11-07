//
//  ContentView.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 29/09/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject var contentViewModel = ContentViewModel(moc: PersistenceController.shared.container.viewContext)

    init() {
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont.boldSystemFont(ofSize: 30)]
    }

    var body: some View {
        NavigationView {
            VStack {
                FlashCardView(entry: $contentViewModel.currentEntry)
                EntryDetailView(entry: $contentViewModel.currentEntry)
                Spacer()
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
                        ToolbarButtonView(buttonName: "settings", state: $contentViewModel.showSettingsView)
                    }
                    .sheet(isPresented: $contentViewModel.showSettingsView) {
                        SettingsView()
                    }
                }
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().preferredColorScheme(.dark)
        }
    }
}
