//
//  UserDefaultManager.swift
//  POCCV
//
//  Created by Omar Hernandez Gonzalez on 01/03/24.
//

import Foundation
import UIKit

extension UserDefaults {
    static let suiteName: String = "group.ohg.poccv.defaults"
    
    func save(entity: Encodable) {
        guard let sharedUserDefaults = UserDefaults(suiteName: UserDefaults.suiteName) else {
            // Error handling
            return
        }
        let thisType = type(of: entity.self)
        let name = String(describing: thisType)
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(entity) {
            let defaults = sharedUserDefaults
            defaults.set(encoded, forKey: name)
        }
    }
    
    func get<Response: Decodable>() throws -> Response? {
        let name = String(describing: Response.self)
        print(name)
        guard let sharedUserDefaults = UserDefaults(suiteName: UserDefaults.suiteName) else {
            // Error handling
            print(UserDefaults.suiteName + "error")
            return nil
        }
        if let data = sharedUserDefaults.object(forKey: name) as? Data {
            let decoder = JSONDecoder()
            return try? decoder.decode(Response.self, from: data)
        } else {
            return nil
        }
    }
    
    func save(image: UIImage) {
        guard let data = image.jpegData(compressionQuality: 0.5),
        let encoded = try? PropertyListEncoder().encode(data) else {
            return
        }
        guard let sharedUserDefaults = UserDefaults(suiteName: UserDefaults.suiteName) else {
            // Error handling
            print(UserDefaults.suiteName + "error")
            return
        }
        // Store URL in User Defaults
        sharedUserDefaults.set(encoded, forKey: "photo")
    }
    
    func getPhoto() -> UIImage? {
        guard let sharedUserDefaults = UserDefaults(suiteName: UserDefaults.suiteName),
              let data = sharedUserDefaults.data(forKey: "photo"),
              let decoded = try? PropertyListDecoder().decode(Data.self, from: data) else {
            // Error handling
            print(UserDefaults.suiteName + "error")
            return nil
        }
        return UIImage(data: decoded)
    }
}
