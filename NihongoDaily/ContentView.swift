//
//  ContentView.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 29/09/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject private var contentViewModel = ContentViewModel()

    init() {
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont.boldSystemFont(ofSize: 30)]
    }
    
    var body: some View {
        NavigationView {
            VStack {
                FlashCardView(entry:$contentViewModel.currentEntry)
                //EntryListView(entries:entries)
                Button(action: {
                    contentViewModel.getNewEntry()
                }) {
                    Text("New Word")
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .padding()
                Spacer()
            }
            .navigationBarTitle("Word of the day", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        ToolbarButtonView(buttonName: "settings", state: $contentViewModel.showHomeView)
                        ToolbarButtonView(buttonName: "about", state: $contentViewModel.showHomeView)
                    }.sheet(isPresented: $contentViewModel.showHomeView) {
                        AboutView()
                    }
                }
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().preferredColorScheme(.dark).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
