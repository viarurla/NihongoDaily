//
//  AppTabNavigation.swift
//  NihongoDaily
//
//  Created by Oliver Jacobs on 17/11/2021.
//

import SwiftUI

struct AppTabNavigation: View {
    // Experimenting with using a less convoluted, tab based view instead

    enum Tab {
        case home
        case settings
        case history
    }

    @State private var selection: Tab = .home

    var body: some View {
        TabView(selection: $selection) {
            NavigationView {
                HomeView().navigationBarTitle("Word of the day", displayMode: .inline)
            }
            .tabItem {
                let menuText = Text("Home", comment: "Home screen")
                Label {
                    menuText
                } icon: {
                    Image(systemName: "house.fill")
                }.accessibility(label: menuText)
            }
            .tag(Tab.home)

            NavigationView {
                HistoryView().navigationBarTitle("History", displayMode: .inline)
            }
            .tabItem {
                let menuText = Text("History", comment: "History view")
                Label {
                    menuText
                } icon: {
                    Image(systemName: "gobackward")
                }.accessibility(label: menuText)
            }
            .tag(Tab.history)

            NavigationView {
                SettingsView().navigationBarTitle("Settings", displayMode: .inline)
            }
            .tabItem {
                let menuText = Text("Settings", comment: "Settings")
                Label {
                    menuText
                } icon: {
                    Image(systemName: "wrench.fill")
                }.accessibility(label: menuText)
            }
            .tag(Tab.settings)
        }
    }
}

struct AppTabNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AppTabNavigation().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
