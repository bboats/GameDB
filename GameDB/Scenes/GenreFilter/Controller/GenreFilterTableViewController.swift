//
//  GenreFilterTableViewController.swift
//  GameDB
//
//  Created by Tag Livros on 09/01/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import UIKit

class GenreFilterTableViewController: UITableViewController {
    
    // MARK: - Properties
    let viewModel = GenreFilterViewModel()
    let genreCellIdentifier = "genreCell"
    let refresher = UIRefreshControl()
    var gamesTab: GameSearchTableViewController? = nil


    
    // MARK: -Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupBind()
        setupFetch()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        gamesTab?.filteredGenres = viewModel.selectedGenres
    }

    // MARK: - Tableview Datasource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.getGenreCount()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: genreCellIdentifier, for: indexPath) as! GenreTableViewCell
        cell.selectionStyle = .none
        
        cell.genre = viewModel.getGenreByIndex(index: indexPath.row)

        return cell
    }
    
    // MARK: - Tableview Delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectedGenres.append(viewModel.getGenreByIndex(index: indexPath.row).slug)
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        viewModel.selectedGenres.removeAll { $0 == viewModel.getGenreByIndex(index: indexPath.row).slug }
    }
    
    // MARK: - Functions
    func setupTableView() {
        tableView.addSubview(refresher)
        tableView.allowsMultipleSelection = true
    }
    
    private func setupBind() {
        viewModel.reloadTableView = self.tableView.reloadData
        viewModel.beginLoading = refresher.beginRefreshing
        viewModel.finishLoading = refresher.endRefreshing
        let gamesNavigationView = self.tabBarController?.viewControllers![0] as! UINavigationController
        gamesTab = gamesNavigationView.viewControllers[0] as? GameSearchTableViewController
    }

    private func setupFetch() {
        viewModel.getGenreList()
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
