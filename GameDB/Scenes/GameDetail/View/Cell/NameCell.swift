//
//  NameCell.swift
//  GameDB
//
//  Created by Tag Livros on 13/01/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import Foundation
import UIKit

class NameCell: UITableViewCell {
    
    // MARK: - Properties
    var gameTitle: String? {
        didSet {
            gameTitleLabel.text = gameTitle
        }
    }
    
    // MARK: - Outlets
    @IBOutlet weak var gameTitleLabel: UILabel!
    
    
}
