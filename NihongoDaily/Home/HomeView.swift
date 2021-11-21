//
//  HomeView.swift
//  NihongoDaily
//
//  Created by Oliver Jacobs on 17/11/2021.
//

import SwiftUI

struct HomeView: View {
    // See about finding a better way to pass this along
    @StateObject var viewModel = HomeViewModel(moc: PersistenceController.shared.container.viewContext)
    
    @State var btnPressed: Bool = false
    
    var body: some View {
        VStack {
            Text(Date.now, format: .dateTime)
            FlashCard(entry: $viewModel.currentEntry)
                .scaleEffect()
                .animation(.easeInOut(duration: 0.5), value: btnPressed ? 1.1 : 1.0)
            EntryDetail(entry: $viewModel.currentEntry)
                .scaleEffect()
                .animation(.easeInOut(duration: 1), value: btnPressed ? 1.1 : 1.0)
            Button(action: {
                btnPressed.toggle()
                viewModel.getNewEntry()
            }) {
                HStack {
                    Text("new word").font(.system(size: 18))
                    Image(systemName: "clock.arrow.2.circlepath")
                }
            }
            .buttonStyle(PrimaryBtnStyle())
            Spacer()
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
