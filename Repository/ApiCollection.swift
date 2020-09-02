//
//  ApiCollection.swift
//  Repository
//
//  Created by Daniel Barreto on 29/08/20.
//  Copyright © 2020 Daniel Barreto. All rights reserved.
//

import Foundation

public struct ApiCollection<T: Codable>: Codable {
    public var items: [T]
}
