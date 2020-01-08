//
//  Platform.swift
//  GameDB
//
//  Created by Gustavo Lembert da Cunha on 08/01/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import Foundation

struct Platform: Decodable {
    let platform: PlatformData
}

struct PlatformData: Decodable {
    let name: String
}
