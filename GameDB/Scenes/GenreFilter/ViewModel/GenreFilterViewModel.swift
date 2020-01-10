//
//  GenreFilterViewModel.swift
//  GameDB
//
//  Created by Tag Livros on 10/01/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import Foundation

class GenreFilterViewModel {
    
    // MARK: - Properties
    private let genreFilterNetworking = GenreFilterNetworking()
    var genreList: [(genre: Genre, selected: Bool)] = []
    var selectedGenres: [String] = []
    var reloadTableView: () -> Void = {}
    var beginLoading: () -> Void = {}
    var finishLoading: () -> Void = {}
    
    // MARK: - Functions
    func getGenreList() {
        beginLoading()
        genreFilterNetworking.getGenreList(parameters: [:]) { response in
            self.finishLoading()
            guard let unResults = response.results else { return }
            for genre in unResults {
                self.genreList.append((genre, false))
            }
            self.reloadTableView()
        }
    }
    
    func getGenreCount() -> Int {
        return genreList.count
    }
    
    func getGenreByIndex(index: Int) -> Genre {
        if genreList.indices.contains(index) {
            return genreList[index].genre
        } else {
            return Genre(name: "out of bounds", imageBackground: "")
        }
    }
    
    func selectGenreAt(index: Int) -> Bool {
        genreList[index].selected = !genreList[index].selected
        return genreList[index].selected
    }
}
