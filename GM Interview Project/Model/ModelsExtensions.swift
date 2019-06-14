//
//  ModelsExtensions.swift
//  GM Interview Project
//
//  Created by Soroush Kadineh on 6/13/19.
//  Copyright © 2019 Soroush Kadineh. All rights reserved.
//

import Foundation
import UIKit

/// MARK:- models
struct CommitModel {
    let author, hash, message: String
    init(author: String, hash: String, message: String) {
        self.author     = author
        self.hash       = hash
        self.message    = message
    }
}

enum IndicatorState {
    case on
    case off
    
    var bool: Bool {
        switch self {
        case .on:   return true
        case .off:  return false
        }
    }
}

/// MARK:- extensions
extension CommitModel {
    func prettyString () -> NSAttributedString {
        let attribuetdString = NSMutableAttributedString(string: GenericStrings.emptyString)
        attribuetdString.append(NSAttributedString(string: formAuthorString(),   attributes: StringAttributes.redBold))
        attribuetdString.append(NSAttributedString(string: formHashString(),     attributes: StringAttributes.blueRegular))
        attribuetdString.append(NSAttributedString(string: formMessageString(),  attributes: StringAttributes.garyRegular))
        return attribuetdString
    }
    
    func formAuthorString () -> String {
        return "\(GenericStrings.author)\(self.author.trimSpaces())\(GenericStrings.doubleLine)"
    }
    
    func formHashString () -> String {
        return "\(GenericStrings.hash)\(self.hash.trimSpaces())\(GenericStrings.doubleLine)"
    }
    
    func formMessageString () -> String {
        return "\(GenericStrings.message)\(self.message.trimSpaces())"
    }
}

extension String {
    func trimSpaces () -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

extension Collection {
    subscript(safe index: Index) -> Element? {
        return self.indices.contains(index) ? self[index] : nil
    }
}
