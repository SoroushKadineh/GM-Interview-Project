//
//  Constants.swift
//  GM Interview Project
//
//  Created by Soroush Kadineh on 6/13/19.
//  Copyright © 2019 Soroush Kadineh. All rights reserved.
//

import Foundation

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

// MARK:- typealias
typealias GenericDictionary = [String:Any]
