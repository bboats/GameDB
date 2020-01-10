//
//  GenreFilterNetworking.swift
//  GameDB
//
//  Created by Tag Livros on 10/01/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import Foundation
import Alamofire

class GenreFilterNetworking {
    // MARK: - Properties
      let baseUrl = "https://api.rawg.io/api"
      
      func getGenreList(parameters: [String:Any], completion: @escaping(GenreList) -> Void ) {
          request("\(baseUrl)/genres",
              method: .get,
              parameters: parameters).responseJSON { response in
                  do {
                      let decoder = JSONDecoder()
                      decoder.keyDecodingStrategy = .convertFromSnakeCase
                      let responseData = try decoder.decode(GenreList.self, from: response.data!)
                      completion(responseData)
                  } catch {
                      print(error)
                  }
          }
      }
}
