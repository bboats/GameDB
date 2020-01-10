//
//  TabBarViewController.swift
//  GameDB
//
//  Created by Tag Livros on 09/01/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import UIKit
import FontAwesome_swift

class TabBarViewController: UITabBarController {

    private let gameSeachVC = UIStoryboard(name: "GameSearch", bundle: nil).instantiateInitialViewController()
    private let genreFilterVC = UIStoryboard(name: "GenreFilter", bundle: nil).instantiateInitialViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupViewControlers()
    }
    
    
    // MARK: - Functions
    private func setupTabBar() {
        tabBar.tintColor = .red
        tabBar.barTintColor = .black
        tabBar.unselectedItemTintColor = .white
    }
    
    private func setupViewControlers() {
        gameSeachVC?.tabBarItem.title = "Games"
        gameSeachVC?.tabBarItem.image = UIImage.fontAwesomeIcon(name: .gamepad, style: .solid, textColor: .black, size: CGSize(width: 35, height: 35))
        
        genreFilterVC?.tabBarItem.title = "Filter"
        genreFilterVC?.tabBarItem.image = UIImage.fontAwesomeIcon(name: .filter, style: .solid, textColor: .black, size: CGSize(width: 35, height: 35))
        
        viewControllers = [gameSeachVC!, genreFilterVC!]
        selectedViewController = gameSeachVC
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
