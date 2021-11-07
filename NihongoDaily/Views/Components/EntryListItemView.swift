//
//  EntryListItemView.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 09/10/2021.
//

import SwiftUI

struct EntryListItemView: View {
    

    
    let entry: EntryViewModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.white)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
            VStack {
                Text(entry.kana)
                    .font(.title3).bold().padding()
                Divider()
                Text(entry.definition)
                Text(entry.kanji)
                Text(entry.misc)
            }
            .padding(10)
            .multilineTextAlignment(.center)
        }
        //.frame(width: 360, height: 100)
    }
}

struct EntryListItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            EntryListItemView(entry: PersistenceController.DatabaseManager.entries[10])
        }.previewLayout(.fixed(width: 350, height: 180))
    }

}
