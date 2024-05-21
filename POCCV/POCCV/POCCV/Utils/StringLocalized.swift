//
//  StringLocalized.swift
//  POCCV
//
//  Created by Omar Hernandez Gonzalez on 09/02/24.
//

import Foundation

extension String {
    
    /// Variable to determine that the string is a localizable
    var localizable: String {
        return NSLocalizedString(self, comment: self)
    }
    
    struct Localized {
        static func getLocalizedString(_ key: String) -> String {
            return NSLocalizedString(key, comment: key)
        }
        
        static var start: String { return getLocalizedString(#function) }
        static var next: String { return getLocalizedString(#function) }
        static var close: String { return getLocalizedString(#function) }
        static var finalize: String { return getLocalizedString(#function) }
        static var export: String { return getLocalizedString(#function) }
        static var save: String { return getLocalizedString(#function) }
        static var delete: String { return getLocalizedString(#function) }
        static var deleteDesc: String { return getLocalizedString(#function) }
        static var accept: String { return getLocalizedString(#function) }
        static var cancel: String { return getLocalizedString(#function) }
        static var downloadApp: String { return getLocalizedString(#function) }
        static var uploadPhoto: String { return getLocalizedString(#function) }
        static var emptyField: String { return getLocalizedString(#function) }
        static var isRequired: String { return getLocalizedString(#function) }

        // MARK: Personal
        static var personalTitle: String { return getLocalizedString(#function) }
        static var name: String { return getLocalizedString(#function) }
        static var lastname: String { return getLocalizedString(#function) }
        static var birthDate: String { return getLocalizedString(#function) }
        static var profile: String { return getLocalizedString(#function) }

        // MARK: Contact
        static var contactTitle: String { return getLocalizedString(#function) }
        static var email: String { return getLocalizedString(#function) }
        static var phone: String { return getLocalizedString(#function) }
        static var cellphone: String { return getLocalizedString(#function) }
        static var address: String { return getLocalizedString(#function) }
        
        // MARK: Academic
        static var acedemicTitle: String { return getLocalizedString(#function) }
        static var schoolName: String { return getLocalizedString(#function) }
        static var schoolStart: String { return getLocalizedString(#function) }
        static var schoolFinish: String { return getLocalizedString(#function) }
        static var schoolCity: String { return getLocalizedString(#function) }
        static var schoolDegree: String { return getLocalizedString(#function) }
        static var schoolDescription: String { return getLocalizedString(#function) }
        
        static var workTitle: String { return getLocalizedString(#function) }
        static var workPosition: String { return getLocalizedString(#function) }
        static var workName: String { return getLocalizedString(#function) }
        static var workStart: String { return getLocalizedString(#function) }
        static var workFinish: String { return getLocalizedString(#function) }
        static var workAddress: String { return getLocalizedString(#function) }
        static var workDescription: String { return getLocalizedString(#function) }
        static var competence: String { return getLocalizedString(#function) }

        static var acedemicTitleSection: String { return getLocalizedString(#function) }
        static var employementTitleSection: String { return getLocalizedString(#function) }
        static var detailsTitleSection: String { return getLocalizedString(#function) }
        static var profileTitleSection: String { return getLocalizedString(#function) }
        static var presentation: String { return getLocalizedString(#function) }
        static var competencesTitle: String { return getLocalizedString(#function) }
        static var competencesSection: String { return getLocalizedString(#function) }
        static var inviteDesc: String { return getLocalizedString(#function) }
        static var inviteDesc1: String { return getLocalizedString(#function) }
    }
}
