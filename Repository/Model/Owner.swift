//
//  Owner.swift
//  Repository
//
//  Created by Daniel Barreto on 29/08/20.
//  Copyright © 2020 Daniel Barreto. All rights reserved.
//

import Foundation

struct Owner: Codable {
    var url: String?
    var avatarUrl: String?
    var login : String?
}

extension Owner {
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case avatarUrl = "avatar_url"
        case login = "login"
    }
}

extension Owner: Equatable {
    public static func == (lhs: Owner, rhs: Owner) -> Bool {
        return lhs.url == rhs.url
            && lhs.avatarUrl == rhs.avatarUrl
            && lhs.login == rhs.login
    }
}
