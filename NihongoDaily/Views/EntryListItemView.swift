//
//  EntryListItemView.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 09/10/2021.
//

import SwiftUI

struct EntryListItemView: View {
    

    
    //let entry: Entry!
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.white)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
//            VStack {
//                Text(entry.kanji!)
//                    .font(.title3).bold()
//                Divider()
//                Text(entry.reading!)
//                Text(entry.gloss!)
//                Text(entry.position!)
//            }
//            .padding(20)
//            .multilineTextAlignment(.center)
        }
        //.frame(width: 360, height: 100)
    }
}

struct EntryListItemView_Previews: PreviewProvider {
    static var previews: some View {
        //let entry = PersistenceController.DatabaseManager.getEntryById(id: 2120650)
        Group{
            EntryListItemView()//entry: entry)
        }.previewLayout(.fixed(width: 350, height: 180))
    }

}
