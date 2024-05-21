//
//  Extension+Date.swift
//  POCCV
//
//  Created by Omar Hernandez Gonzalez on 01/03/24.
//

import Foundation

extension Date {
    static let defaultFormat = "MMMM yyyy"
    static let monthYear = "MM yyyy"
    static let dayMontYear = "dd/MM/yyyy"

    func defaultString() -> String {
        return self.string(format: Date.defaultFormat)
    }
    
    func string(format: String = Date.defaultFormat) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    func initialize(string: String, format: String = Date.defaultFormat) -> Date {
        // Create Date Formatter
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        // Convert String to Date
        return dateFormatter.date(from: string) ?? Date()
    }
}
