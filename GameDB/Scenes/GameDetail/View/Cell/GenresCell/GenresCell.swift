//
//  GenresCell.swift
//  GameDB
//
//  Created by Tag Livros on 13/01/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import Foundation
import UIKit

class GenresCell: UITableViewCell {
    
    // MARK: - Properties
    var genres: [Genre]?
    
    // MARK: - Outlets
    @IBOutlet weak var genresCollectionView: UICollectionView!
    
    func setupCollectionView() {
        genresCollectionView.dataSource = self
        genresCollectionView.delegate = self
        genresCollectionView.reloadData()
    }
}

extension GenresCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genres?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "genreCell", for: indexPath) as! GenreCollectionViewCell
        cell.backgroundColor = .black
        cell.genreLabel.textColor = .white
        cell.genre = genres?[indexPath.row].name ?? ""
        cell.sizeToFit()
        
        return cell
    }
    
}

extension GenresCell: UICollectionViewDelegate {
    
    
}

extension GenresCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 50)
    }
}
