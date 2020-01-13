//
//  GameDetail.swift
//  GameDB
//
//  Created by Gustavo Lembert da Cunha on 08/01/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import Foundation

struct GameDetail: Decodable {
    let backgroundImage: String?
    let name: String?
    let clip: Clip?
    let descriptionRaw: String?
    let released: String?
    let rating: Float?
    let parentPlatforms: [Platform]?
    let genres: [Genre]?
    let tags: [Tag]?
}
