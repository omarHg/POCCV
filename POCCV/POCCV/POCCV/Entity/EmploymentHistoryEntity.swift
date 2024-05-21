//
//  EmploymentHistoryEntity.swift
//  POCCV
//
//  Created by Omar Hernandez Gonzalez on 09/02/24.
//

import Foundation

struct EmploymentHistoryEntity: Codable {
    var id: Int
    var title: String
    var employer: String
    var start: Date
    var finish: Date
    var city: String
    var description: String?
    
    init(id: Int, title: String, employer: String, start: Date, finish: Date, city: String, description: String? = nil) {
        self.id = id
        self.title = title
        self.employer = employer
        self.start = start
        self.finish = finish
        self.city = city
        self.description = description
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? Int(Date().timeIntervalSince1970)
        self.title = try container.decode(String.self, forKey: .title)
        self.employer = try container.decode(String.self, forKey: .employer)
        self.start = try container.decode(Date.self, forKey: .start)
        self.finish = try container.decode(Date.self, forKey: .finish)
        self.city = try container.decode(String.self, forKey: .city)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
    }
     
    func fullTitle() -> String {
        return String(format: "%@ en %@, %@", title, employer, city)
    }
    
    func fullDate() -> String {
        return String(format: "%@, %@", start.defaultString(), finish.defaultString())
    }
}

