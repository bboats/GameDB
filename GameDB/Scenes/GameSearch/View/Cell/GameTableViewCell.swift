//
//  GameTableViewCell.swift
//  GameDB
//
//  Created by Gustavo Lembert da Cunha on 08/01/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import UIKit
import FontAwesome_swift

class GameTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var gameTitleLabel: UILabel!
    @IBOutlet weak var ratingView: UIView!
    @IBOutlet weak var ratingLabel: UILabel!
    
    // MARK: - Properties
    var game: GameSample! {
        didSet {
            setupCell()
        }
    }
    
    // MARK: - Functions
    private func setupCell() {
        gameTitleLabel.text = game.name
        gameTitleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        gameTitleLabel.textColor = .black
        
        ratingView.layer.cornerRadius = 10
        if game.ratingsCount! > 10, let unRating = game.rating {
            ratingLabel.text = String(unRating)
            ratingLabel.font = UIFont.boldSystemFont(ofSize: 18)
            switch unRating {
            case 0.0..<1.25:
                ratingView.backgroundColor = .systemRed
                break
            case 1.25..<2.5:
                ratingView.backgroundColor = .systemOrange
                break
            case 2.5..<3.75:
                ratingView.backgroundColor = .systemYellow
                break
            case 3.75..<5:
                ratingView.backgroundColor = .systemGreen
                break
            default:
                ratingView.backgroundColor = .black
                break
            }
        } else {
            ratingView.backgroundColor = .black
            ratingLabel.text = "N/A"
        }
    }
}
