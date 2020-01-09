//
//  GameSearchTableViewController.swift
//  GameDB
//
//  Created by Gustavo Lembert da Cunha on 08/01/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import UIKit

class GameSearchTableViewController: UITableViewController {

    // MARK: - Outlets
    
    // MARK: - Properties
    //instanciar os balaco
    private let gameCellIdentifier = "gameCell"
    private let viewModel = GameSearchViewModel()
    private var lastPage = 1
    private let refresher = UIRefreshControl()
    
    private let searchBar = UISearchBar()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        setupTableView()
        setupBind()
        setupFetch()
    }
    
    // MARK: - Functions
    private func setupTableView() {
        tableView.addSubview(refresher)
        
        navigationItem.titleView = searchBar
        
        refresher.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
    
    private func setupSearchBar() {
        searchBar.delegate = self
    }
    
    func setupBind() {
        viewModel.reloadTableView = tableView.reloadData
        viewModel.finishLoading = refresher.endRefreshing
    }

    func setupFetch() {
        refresher.beginRefreshing()
        viewModel.getGameSample(page: lastPage)
    }
    
    @objc func refreshData() {
        viewModel.getGameSample(page: 1)
    }
    
    // MARK: - DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getGameCount()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let gameCell = tableView.dequeueReusableCell(withIdentifier: gameCellIdentifier, for: indexPath) as? GameTableViewCell,
            let unGame = viewModel.getGameByIndex(index: indexPath.row) {
            gameCell.game = unGame
            
            return gameCell
        } else {
            return UITableViewCell()
        }
    }
    
    // MARK: - TableViewDelegate
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.getGameCount() - 5 {
            lastPage += 1
            viewModel.getGameSample(page: lastPage)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
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

extension GameSearchTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //filtrar resultados de acordo com o texto pesquisado
        guard let texto = searchBar.text else { return }
        print(texto)
    }
}
