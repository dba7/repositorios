//
//  Repository.swift
//  Repository
//
//  Created by Daniel Barreto on 29/08/20.
//  Copyright © 2020 Daniel Barreto. All rights reserved.
//

import Foundation

struct Repository: Codable {
    var name: String?
    var starsCount: Double?
    var owner: Owner?
    var fullName: String?
}

extension Repository {
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case starsCount = "stargazers_count"
        case owner = "owner"
        case fullName = "full_name"
    }
}

extension Repository: Equatable {
    public static func == (lhs: Repository, rhs: Repository) -> Bool {
        return lhs.name == rhs.name
            && lhs.starsCount == rhs.starsCount
            && lhs.owner == rhs.owner
            && lhs.fullName == rhs.fullName
    }
}
