//
//  AcademicInformationEntity.swift
//  POCCV
//
//  Created by Omar Hernandez Gonzalez on 09/02/24.
//

import Foundation

struct AcademicInformationEntity: Codable {
    var id: Int
    var name: String
    var start: Date
    var finish: Date
    var city: String
    var degree: String
    var description: String?
    
    func fullTitle() -> String {
        return String(format: "%@, %@, %@", degree, name, city)
    }
    
    func fullDate() -> String {
        String(format: "%@, %@", start.defaultString(), finish.defaultString())
    }
}
