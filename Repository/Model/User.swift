//
//  Owner.swift
//  Repository
//
//  Created by Daniel Barreto on 01/09/20.
//  Copyright © 2020 Daniel Barreto. All rights reserved.
//

import Foundation

struct User: Codable {
    var login: String?
    var name: String?
}

extension User {
    enum CodingKeys: String, CodingKey {
        case login = "login"
        case name = "name"
    }
}

extension User: Equatable {
    public static func == (lhs: User, rhs: User) -> Bool {
        return lhs.login == rhs.login
            && lhs.name == rhs.name
    }
}
