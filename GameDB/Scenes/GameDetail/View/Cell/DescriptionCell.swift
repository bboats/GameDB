//
//  DescriptionCell.swift
//  GameDB
//
//  Created by Tag Livros on 13/01/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import Foundation
import UIKit

class DescriptionCell: UITableViewCell {
    
    // MARK: - Properties
    var gameDescription: String? {
        didSet {
            gameDescriptionLabel.text = gameDescription
        }
    }
    
    // MARK: - Outlets
    @IBOutlet weak var gameDescriptionLabel: UILabel!
    
    
    
}
