//
//  Constants.swift
//  GM Interview Project
//
//  Created by Soroush Kadineh on 6/13/19.
//  Copyright © 2019 Soroush Kadineh. All rights reserved.
//

import Foundation
import UIKit

/**
 from REST API v3, REST API v3 (https://developer.github.com/v3/repos/commits/#list-commits-on-a-repository)
 GET /repos/:owner/:repo/commits
 commits are returned in chronological order
 Choosing a public repository from github: apple/swift
 */
struct URL_Address {
    static let appleURL = "https://api.github.com/repos/apple/swift/commits"
}

struct Cell_Identifiers {
    static let commitCell = "commitCell"
}

struct Fonts {
    static let boldFont     = UIFont.preferredFont(forTextStyle: .headline)
    static let regularFont  = UIFont.preferredFont(forTextStyle: .body)
}

struct Colors {
    static let red      = UIColor.red
    static let blue     = UIColor.blue
    static let gary     = UIColor.darkGray
}

struct StringAttributes {
    static let redBold      = [NSAttributedString.Key.font : Fonts.boldFont,    NSAttributedString.Key.foregroundColor: Colors.red]
    static let blueRegular  = [NSAttributedString.Key.font : Fonts.regularFont, NSAttributedString.Key.foregroundColor: Colors.blue]
    static let garyRegular  = [NSAttributedString.Key.font : Fonts.regularFont, NSAttributedString.Key.foregroundColor: Colors.gary, NSAttributedString.Key.paragraphStyle: ParagraphStyles.defaultStyle]
}

struct ParagraphStyles {
    static var defaultStyle: NSMutableParagraphStyle {
        let paragraphStyle           = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing   = 4.0
        paragraphStyle.lineBreakMode = .byWordWrapping
        return paragraphStyle
    }
}

struct GenericStrings {
    static let emptyString          = ""
    static let doubleLine           = "\n\n"
    static let author               = "Author:\n"
    static let hash                 = "Commit Hash:\n"
    static let message              = "Commit Message:\n"
    static let error                = "Error"
    static let cancel               = "Cancel"
    static let somethingWentWrong   = "Something went wrong, try again!"
}

struct JsonKeys {
    static let sha      = "sha"
    static let commit   = "commit"
    static let author   = "author"
    static let name     = "name"
    static let message  = "message"
}

// MARK:- typealias
typealias GenericDictionary = [String:Any]
