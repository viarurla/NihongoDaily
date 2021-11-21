//
//  CommonListItem.swift
//  NihongoDaily
//
//  Created by Oliver Jacobs on 21/11/2021.
//

import SwiftUI

struct CommonListItem: View {
    
    var value: String
    
    var body: some View {
        HStack {
            Text(value)
        }
    }
}

struct CommonListItem_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CommonListItem(value: "lorem ipsum")
        }.previewLayout(.fixed(width: 350, height: 80))
    }
}
