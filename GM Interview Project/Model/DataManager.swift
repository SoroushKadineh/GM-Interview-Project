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
    
    final func downloadData (compilitionHandler: @escaping (_ list:[CommitModel]?) -> ()) {
        guard let url = URL(string: URL_Address.appleURL) else { compilitionHandler(nil); return }
        URLSession.shared.dataTask(with: url) { [weak self] (optionalData, optionalResponse, optionalError) in
            guard let strongRef = self else { compilitionHandler(nil); return }
            guard optionalError == nil,
                strongRef.isResponseOk(optionalResponse: optionalResponse),
                let data = optionalData, let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: []) else { compilitionHandler(nil); return }
            compilitionHandler(strongRef.parseData(jsonResponse))
            }.resume()
    }
    
    private func parseData (_ jsonResponse: Any) -> [CommitModel]? {
        guard let jsonArr = jsonResponse as? [GenericDictionary] else { return nil }
        
        var commitList = [CommitModel]()
        
        for json in jsonArr {
            guard let sha = json[JsonKeys.sha] as? String,
                let commit = json[JsonKeys.commit] as? GenericDictionary,
                let author = commit[JsonKeys.author] as? GenericDictionary, let name = author[JsonKeys.name] as? String,
                let message = commit[JsonKeys.message] as? String
                else { continue }
            
            commitList.append(CommitModel(author: name, hash: sha, message: message))
        }
        
        // TODO: total number of commits is 30 consistenly, but if it wasn't i should return whatever i have here, then download additional commits till i get to 25 at least
        
        return commitList
    }
    
    private func isResponseOk (optionalResponse: URLResponse?) -> Bool {
        guard let response = optionalResponse as? HTTPURLResponse, response.statusCode == 200 else { return false }
        return true
    }
}
