//
//  MicroTable.swift
//  NihongoDaily
//
//  Created by Oliver Jacobs on 21/11/2021.
//

import SwiftUI

struct MicroTable: View {
    
    var header: String?
    var items: [String]
    
    var body: some View {
        VStack {
            if (header != nil) {
                Text(header ?? "")
            }
            List {
                ForEach(items, id: \.self) { item in
                    CommonListItem(value:item)
                }
            }
        }
    }
}

struct MicroTable_Previews: PreviewProvider {
    
    static var demoItems: [String] = {
        var items = [String]()
        for i in 1...5 {
            items.append("Item \(i)")
        }
        return items
    }()
    
    static var previews: some View {
        MicroTable(header: "Demo Items", items:demoItems)
    }
}
