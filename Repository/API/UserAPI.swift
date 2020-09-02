//
//  RepositoryAPI.swift
//  Repository
//
//  Created by Daniel Barreto on 01/09/20.
//  Copyright © 2020 Daniel Barreto. All rights reserved.
//

import Foundation

class UserAPI {
    let apiUserPath = "https://api.github.com/users/"

    func fetchUser(login: String?, completionHandler: @escaping (User) -> Void) {
        

        guard let url =  URL(string: apiUserPath + (login ?? "value") ) else {
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let dataJson = data  {

                guard let colectionResponse = try? JSONDecoder().decode(User.self, from: dataJson) else {
                    return
                }
                completionHandler(colectionResponse)
               
            }
        }.resume()

    }
}
