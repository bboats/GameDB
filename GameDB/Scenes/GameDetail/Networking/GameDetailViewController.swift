//
//  GameDetailViewController.swift
//  GameDB
//
//  Created by Tag Livros on 13/01/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import UIKit
import Kingfisher

class GameDetailViewController: UIViewController {

    // MARK: - Parameters
    var gameId: Int?
    let viewModel = GameDetailViewModel()
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupBind()
        viewModel.getGameDetail(gameId: gameId ?? 1)
    }
    
    // MARK: - Functions
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
    }
    
    private func setupBind() {
        viewModel.reloadData = self.reloadData
    }

    private func reloadData() {
        let url = URL(string: (viewModel.gameDetail?.backgroundImage) ?? "")
        backgroundImage.kf.setImage(with: url)
        tableView.reloadData()
    }
    
}

extension GameDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "clearCell") as! ClearCell
            cell.backgroundColor = .clear
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell") as! NameCell
            cell.gameTitle = viewModel.gameDetail?.name
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "descriptionCell") as! DescriptionCell
            cell.gameDescription = viewModel.gameDetail?.descriptionRaw
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "genresCell") as! GenresCell
            cell.setupCollectionView()
            cell.genres = viewModel.gameDetail?.genres
            cell.backgroundColor = .black
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    
}

extension GameDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 200
        case 1:
            return 50
        case 2:
            return 150
        default:
            return 100
        }
    }
}
