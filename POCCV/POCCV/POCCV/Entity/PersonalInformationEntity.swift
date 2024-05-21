//
//  PersonalInformationEntity.swift
//  POCCV
//
//  Created by Omar Hernandez Gonzalez on 09/02/24.
//

import Foundation
import UIKit

struct PersonalInformationEntity: Codable {
    var name: String
    var lastName: String
    var birthDate: Date
    var profile: String?
    
    var birthDateString: String {
        return birthDate.defaultString()
    }
    
    func fullName() -> String {
        return name + " " + lastName
    }
    
    func CVBirthDateAttributes() -> NSAttributedString {
        
        let attributes = NSMutableAttributedString()
        let title = String.Localized.birthDate
        let dateString = birthDate.string(format: Date.dayMontYear)
        
        let attributes1 = NSAttributedString(string: String(format: "%@", title), attributes: [
            .font: UIFont.semibold14,
            .foregroundColor: UIColor.label.secondaryText]).setLineSpacing(lineHeightMultiple: lineHeightMultipleTitle)
        attributes.append(attributes1)
        
        let attributes2 = NSAttributedString(string: String(format: "\n%@", dateString), attributes: [
            .font: UIFont.semibold14,
            .foregroundColor: UIColor.label.primaryText]).setLineSpacing()
        attributes.append(attributes2)
        
        return attributes
    }
    
}

extension NSMutableAttributedString {
    /*func setLineSpacing(lineSpacing: CGFloat = 0.0,
                        lineHeightMultiple: CGFloat = 0.0) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        let attributedString: NSMutableAttributedString
        addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle,
                     range: NSMakeRange(0, length))
    }*/
}

extension NSAttributedString {
    func setLineSpacing(lineSpacing: CGFloat = 0.0,
                        lineHeightMultiple: CGFloat = 1.0,
                        alignment: NSTextAlignment = .left) -> NSAttributedString {
        let mutableAttributes = NSMutableAttributedString()
        mutableAttributes.append(self)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        paragraphStyle.paragraphSpacing = 4.0
        paragraphStyle.alignment = alignment
        let attributedString: NSMutableAttributedString
        mutableAttributes.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle,
                     range: NSMakeRange(0, length))
        return mutableAttributes
    }
}
