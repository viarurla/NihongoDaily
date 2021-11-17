//
//  CommonFormatter.swift
//  NihongoDaily
//
//  Created by Oliver Jacobs on 15/11/2021.
//

import Foundation

struct CommonFormatter {
        
    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, dd MMM yyyy"
        return formatter.string(from: date)
    }
    
}
