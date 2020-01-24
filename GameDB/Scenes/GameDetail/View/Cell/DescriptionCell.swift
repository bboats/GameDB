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
    
    var showExpandedDescription: () -> Void = {}
    
    // MARK: - Outlets
    @IBOutlet weak var gameDescriptionLabel: UILabel!
    @IBOutlet weak var gradientView: GradientView!
    @IBOutlet weak var showMoreButton: UIButton!
    
    @IBAction func seeMorePressed(_ sender: Any) {
        showExpandedDescription()
    }
    
}
