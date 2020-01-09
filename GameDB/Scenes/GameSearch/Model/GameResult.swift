//
//  File.swift
//  GameDB
//
//  Created by Gustavo Lembert da Cunha on 08/01/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import UIKit

struct GameResult: Decodable {
    let results: [GameSample]?
    
    enum CodingKeys: String, CodingKey {
        case results
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        results = try values.decodeIfPresent([GameSample].self, forKey: .results) ?? []
    }
}

struct GameSample: Decodable {
    let id: Int
    let name: String
    let released: String?
    let backgroundImage: String?
    let rating: Float?
    let ratingsCount: Int?
    let parentPlatforms: [Platform]?
    let genres: [Genre]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case released
        case backgroundImage
        case rating
        case ratingsCount
        case parentPlatforms
        case genres
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        released = try values.decodeIfPresent(String.self, forKey: .released)
        backgroundImage = try values.decodeIfPresent(String.self, forKey: .backgroundImage)
        rating = try values.decodeIfPresent(Float.self, forKey: .rating) ?? 0
        ratingsCount = try values.decodeIfPresent(Int.self, forKey: .ratingsCount) ?? 0
        parentPlatforms = try values.decodeIfPresent([Platform].self, forKey: .parentPlatforms) ?? []
        genres = try values.decodeIfPresent([Genre].self, forKey: .genres) ?? []
    }
}
