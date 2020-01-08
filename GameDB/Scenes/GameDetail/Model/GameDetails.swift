//
//  GameDetailed.swift
//  GameDB
//
//  Created by Gustavo Lembert da Cunha on 08/01/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import Foundation

struct GameDetails: Decodable {
    let name: String
    let description: String
    let released: String
    let background_image: String
    let rating: Float
    let parentPlatforms: [Platform]
    let genres: [Genre]
    let tags: [Tag]
    let clip: Clip
}
