//
//  RepositoryAPI.swift
//  Repository
//
//  Created by Daniel Barreto on 29/08/20.
//  Copyright © 2020 Daniel Barreto. All rights reserved.
//

import Foundation

class RepositoryAPI {
     let apiRepositoryPath = "https://api.github.com/search/repositories?q=language%3Aswift&sort=stars"

    func fetchRepositories(completionHandler: @escaping ([Repository]) -> Void ) {

        guard let url =  URL(string: apiRepositoryPath) else {
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let dataJson = data  {

                guard let colectionResponse = try? JSONDecoder().decode(ApiCollection<Repository>.self, from: dataJson) else {
                    return
                }
                completionHandler(colectionResponse.items)
            }
        }.resume()

    }
}
