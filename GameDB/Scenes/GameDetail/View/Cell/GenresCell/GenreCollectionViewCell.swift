//
//  GenreCollectionViewCell.swift
//  GameDB
//
//  Created by Tag Livros on 13/01/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import UIKit

class GenreCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    var genre: String = "" {
        didSet {
            genreLabel.text = genre
        }
    }
    
    // MARK: - Outlets
    @IBOutlet weak var genreLabel: UILabel!
    
    
}
