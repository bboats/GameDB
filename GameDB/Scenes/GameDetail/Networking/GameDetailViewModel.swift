//
//  GameDetailViewModel.swift
//  GameDB
//
//  Created by Tag Livros on 13/01/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import Foundation

class GameDetailViewModel {
  
    // MARK: - Properties
    var gameDetail: GameDetail?
    private let networking = GameDetailNetworking()
    var reloadData: () -> Void = {}
    
    func getGameDetail(gameId: Int){
        networking.getGameDetail(gameId: gameId) { result in
            self.gameDetail = result
            self.reloadData()
        }
        
    }
}
