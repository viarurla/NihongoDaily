//
//  ContentView.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 29/09/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    #if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.managedObjectContext) private var context
    #endif
    
    var body: some View {
        #if os(iOS)
        if horizontalSizeClass == .compact {
            AppTabNavigation().environment(\.managedObjectContext, context)
        } else {
            AppTabNavigation()
        }
        #else
        AppTabNavigation()
        #endif
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
        }
    }
}
