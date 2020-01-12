//
//  GenreTableViewCell.swift
//  GameDB
//
//  Created by Tag Livros on 10/01/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import UIKit

class GenreTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var genreView: UIView!
    
    
    // MARK: - Properties
    var genre: Genre! {
        didSet {
            setupCell()
        }
    }
    
    // MARK: - Functions
    private func setupCell() {
        genreLabel.text = genre.name
        genreLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        genreView.layer.borderColor = UIColor.red.cgColor
        genreView.layer.borderWidth = 2
        genreView.layer.cornerRadius = 10
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            genreView.layer.backgroundColor = UIColor.black.cgColor
            genreLabel.textColor = .white
        } else {
            genreView.layer.backgroundColor = UIColor.clear.cgColor
            genreLabel.textColor = .black
        }
    }
    
}
