//
//  GradientView.swift
//  GameDB
//
//  Created by Gustavo Lembert da Cunha on 24/01/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import UIKit

class GradientView: UIView {

    @IBInspectable var firstColor: UIColor = UIColor.clear {
       didSet {
           updateView()
        }
     }
     @IBInspectable var secondColor: UIColor = UIColor.clear {
        didSet {
            updateView()
        }
    }
        
    override class var layerClass: AnyClass {
       get {
          return CAGradientLayer.self
       }
    }
    
    func updateView() {
        let layer = self.layer as! CAGradientLayer
        
        layer.colors = [firstColor, secondColor].map{$0.cgColor}
        layer.startPoint = CGPoint(x: 0.5, y: 0)
        layer.endPoint = CGPoint(x: 0.5, y: 1)
    }

}
