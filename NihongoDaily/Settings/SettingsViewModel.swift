//
//  SettingsViewModel.swift
//  NihongoDaily
//
//  Created by Oliver Jacobs on 15/11/2021.
//

import Foundation
import SwiftUI

public class SettingsViewModel {
    
    var settings: [MenuItem]
    
    init () {
        let history = MenuItem(id: 0, name: "History", view: AnyView(HistoryView()))
        settings = [MenuItem]()
        settings.append(history)
    }
    
}

