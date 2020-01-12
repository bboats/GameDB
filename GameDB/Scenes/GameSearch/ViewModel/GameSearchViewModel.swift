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
    var beginLoading: () -> Void = {}
    var finishLoading: () -> Void = {}
    var lastUsedParameters: [String:String] = [:]
    
    //MARK: - Functions
    @objc func getGameSample(page: Int) {
        if page == 1 {
            self.gameSamplesArray = []
            reloadTableView()
        }
        lastUsedParameters["page"] = String(page)
        fetchApiData()
    }
    
    func searchGameSample(page: Int, searchField: String) {
        gameSamplesArray = []
        reloadTableView()
        lastUsedParameters["page"] = String(page)
        lastUsedParameters["search"] = searchField
        fetchApiData()
    }
    
    func filteredSearchGameSample(page: Int, genreList: [String]) {
        gameSamplesArray = []
        reloadTableView()
        lastUsedParameters = ["page": String(page), "genres": genreList.joined(separator: ",")]
        fetchApiData()
    }
    
    //lastUsedParameters sempre eh usado
    private func fetchApiData() {
        self.beginLoading()
        gameSamplesNetworking.getGameSample(parameters: lastUsedParameters) { result in
            guard (result.next != nil) else { return }
            guard let unResults = result.results else { return }
            if self.lastUsedParameters["page"] == "1" {
                self.gameSamplesArray = unResults
            } else {
                self.gameSamplesArray.append(contentsOf: unResults)
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
