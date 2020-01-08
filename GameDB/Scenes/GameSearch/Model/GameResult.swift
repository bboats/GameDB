//
//  File.swift
//  GameDB
//
//  Created by Gustavo Lembert da Cunha on 08/01/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import UIKit

struct GameResult: Decodable {
    let results: [GameSample]
}

struct GameSample: Decodable {
    let id: Int
    let name: String
    let released: String
    let backgroundImage: String
    let rating: Float?
    let parentPlatforms: [Platform]
    let genres: [Genre]
}
