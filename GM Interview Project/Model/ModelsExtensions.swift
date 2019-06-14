//
//  ModelsExtensions.swift
//  GM Interview Project
//
//  Created by Soroush Kadineh on 6/13/19.
//  Copyright © 2019 Soroush Kadineh. All rights reserved.
//

import Foundation

/// MARK:- models
struct CommitModel {
    let author, hash, message: String
    init(author: String, hash: String, message: String) {
        self.author     = author
        self.hash       = hash
        self.message    = message
    }
}

/// MARK:- extensions
extension CommitModel {
    func prettyString () -> NSAttributedString {
        let attribuetdString = NSMutableAttributedString(string: "")
        let bigString =
        """
        \(self.author)
        \(self.hash)
        \(self.message)
        """
        attribuetdString.append(NSAttributedString(string: bigString))
        return attribuetdString
    }
}
        
extension Collection {
    subscript(safe index: Index) -> Element? {
        return self.indices.contains(index) ? self[index] : nil
    }
}
