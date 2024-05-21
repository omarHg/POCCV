//
//  ContactInformationEntity.swift
//  POCCV
//
//  Created by Omar Hernandez Gonzalez on 09/02/24.
//

import Foundation
import UIKit

struct ContactInformationEntity: Codable {
    var email: String
    var phone: String?
    var cellphone: String
    var address: String
    
    func attributes() -> NSAttributedString {
        let attributes = NSMutableAttributedString()
        
        let title: String = .Localized.detailsTitleSection
        let attributes1 = NSAttributedString(string: String(format: "%@\n", title), attributes: [
            .font: UIFont.semibold16,
            .foregroundColor: UIColor.label.primaryText]).setLineSpacing(lineHeightMultiple: lineHeightMultipleTitle)
        attributes.append(attributes1)
        
        let attributes2 = NSAttributedString(string: String(format: "%@", address), attributes: [
            .font: UIFont.semibold14,
            .foregroundColor: UIColor.label.primaryText]).setLineSpacing()
        attributes.append(attributes2)
        
        let attributes3 = NSAttributedString(string: String(format: "\n%@", cellphone), attributes: [
            .font: UIFont.semibold14,
            .foregroundColor: UIColor.label.primaryText]).setLineSpacing()
        attributes.append(attributes3)
        
        if let phone = phone {
            let attributes4 = NSAttributedString(string: String(format: "\n%@", phone), attributes: [
                .font: UIFont.semibold14,
                .foregroundColor: UIColor.label.primaryText]).setLineSpacing()
            attributes.append(attributes4)
        }
        
        let attributes5 = NSAttributedString(string: String(format: "\n%@", email), attributes: [
            .font: UIFont.semibold14,
            .foregroundColor: UIColor.link]).setLineSpacing()
        attributes.append(attributes5)
        
        return attributes
    }
}
