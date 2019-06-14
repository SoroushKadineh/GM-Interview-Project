//
//  DataManager.swift
//  GM Interview Project
//
//  Created by Soroush Kadineh on 6/13/19.
//  Copyright © 2019 Soroush Kadineh. All rights reserved.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    func downloadData (compilitionHandler: @escaping (_ list:[CommitModel]?) -> ()) {
        guard let url = URL(string: URL_Address.appleURL) else { compilitionHandler(nil); return }
        URLSession.shared.dataTask(with: url) { [weak self] (optionalData, optionalResponse, optionalError) in
            guard let strongRef = self else { compilitionHandler(nil); return }
            guard optionalError == nil,
                strongRef.isResponseOk(optionalResponse: optionalResponse),
                let data = optionalData, let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: []) else { compilitionHandler(nil); return }
            compilitionHandler(strongRef.parseData(jsonResponse))
        }.resume()
    }
    
    func parseData (_ jsonResponse: Any) -> [CommitModel]? {
        guard let jsonArr = jsonResponse as? [GenericDictionary] else { return nil }
        
        var commitList = [CommitModel]()
        return commitList
    }
    
    func isResponseOk (optionalResponse: URLResponse?) -> Bool {
        guard let response = optionalResponse as? HTTPURLResponse, response.statusCode == 200 else { return false }
        return true
    }
}
