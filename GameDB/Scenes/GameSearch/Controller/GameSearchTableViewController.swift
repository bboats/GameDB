//
//  GameSearchTableViewController.swift
//  GameDB
//
//  Created by Gustavo Lembert da Cunha on 08/01/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import UIKit

class GameSearchTableViewController: UITableViewController {

    // MARK: - Properties
    //instanciar os balaco
    private let gameCellIdentifier = "gameCell"
    private let viewModel = GameSearchViewModel()
    private var lastPage = 1
    private let refresher = UIRefreshControl()
    private let searchBar = UISearchBar()
    //propriedade recebida atraves da GenreFilterController
    var filteredGenres: [String] = [] {
        didSet {
            if filteredGenres == [] {
                viewModel.lastUsedParameters["genres"] = nil
            } else if viewModel.lastUsedParameters["genres"] != filteredGenres.joined(separator: ",") {
                viewModel.lastUsedParameters["genres"] = filteredGenres.joined(separator: ",")
            }
            viewModel.getGameSample(page: 1)
        }
    }
    
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
        
        searchBar.backgroundColor = .white
        navigationItem.titleView = searchBar
        
        refresher.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
    
    private func setupSearchBar() {
        searchBar.delegate = self
    }
    
    func setupBind() {
        viewModel.reloadTableView = tableView.reloadData
        viewModel.beginLoading = refresher.beginRefreshing
        viewModel.finishLoading = refresher.endRefreshing
    }

    func setupFetch() {
        viewModel.getGameSample(page: lastPage)
    }
    
    @objc func refreshData() {
        viewModel.getGameSample(page: 1)
    }
    
    @objc func refreshSearchData() {
        guard let texto = searchBar.text else { return }
        viewModel.searchGameSample(page: 1, searchField: texto)
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedGame = viewModel.getGameByIndex(index: indexPath.row)
        performSegue(withIdentifier: "gameDetail", sender: selectedGame?.id)
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gameDetail" {
            let vc = segue.destination as! GameDetailViewController
        
            vc.gameId = sender as? Int
        }
        // Pass the selected object to the new view controller.
    }

}

extension GameSearchTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(refreshSearchData), object: nil)
        guard let texto = searchBar.text else { return }
        lastPage = 1
        viewModel.searchGameSample(page: lastPage, searchField: texto)
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(refreshSearchData), object: nil)
        self.perform(#selector(refreshSearchData), with: nil, afterDelay: 0.5)
    }

}
