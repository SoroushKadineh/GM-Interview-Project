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
}

/// MARK:- extensions
extension CommitModel {
    func prettyString () -> NSAttributedString {
        let attribuetdString = NSMutableAttributedString(string: "")
        return attribuetdString
    }
}
        
extension Collection {
    subscript(safe index: Index) -> Element? {
        return self.indices.contains(index) ? self[index] : nil
    }
}
