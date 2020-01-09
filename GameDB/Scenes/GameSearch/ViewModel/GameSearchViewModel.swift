//
//  GameSearchViewModel.swift
//  GameDB
//
//  Created by Gustavo Lembert da Cunha on 08/01/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import Foundation

class GameSearchViewModel {
    
    //MARK: - Properties
    let gameSamplesNetworking = GameSampleNetworking()
    private var gameSamplesArray: [GameSample] = []
    var reloadTableView: () -> Void = {}
    var finishLoading: () -> Void = {}
    
    //MARK: - Functions
    func getGameSample(page: Int) {
        gameSamplesNetworking.getGameSample(page: page) { result in
            if page == 1 {
                self.gameSamplesArray = result.results
            } else {
                self.gameSamplesArray.append(contentsOf: result.results)
            }
            self.reloadTableView()
            self.finishLoading()
        }
    }
    
    func getGameByIndex(index: Int) -> GameSample? {
        guard gameSamplesArray.indices.contains(index) else { return nil }
        return gameSamplesArray[index]
    }
    
    func getGameCount() -> Int {
        return gameSamplesArray.count
    }
    
}
