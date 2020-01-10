//
//  GameSampleNetworking.swift
//  GameDB
//
//  Created by Gustavo Lembert da Cunha on 08/01/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import Foundation
import Alamofire

class GameSampleNetworking {
    
    // MARK: - Properties
    let baseUrl = "https://api.rawg.io/api"
    
    func getGameSample(parameters: [String:Any], completion: @escaping(GameResult) -> Void ) {
        request("\(baseUrl)/games",
            method: .get,
            parameters: parameters).responseJSON { response in
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let responseData = try decoder.decode(GameResult.self, from: response.data!)
                    completion(responseData)
                } catch {
                    print(error)
                }
        }
    }
}
