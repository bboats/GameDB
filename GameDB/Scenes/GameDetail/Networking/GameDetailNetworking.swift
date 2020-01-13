//
//  GameDetailNetworking.swift
//  GameDB
//
//  Created by Tag Livros on 13/01/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import Foundation
import Alamofire

class GameDetailNetworking {
    
    // MARK: - Properties
    let baseUrl = "https://api.rawg.io/api"
    
    func getGameDetail(gameId: Int, completion: @escaping(GameDetail) -> Void ) {
        request("\(baseUrl)/games/\(gameId)",
            method: .get).responseJSON { response in
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let responseData = try decoder.decode(GameDetail.self, from: response.data!)
                    completion(responseData)
                } catch {
                    print(error)
                }
        }
    }
}
