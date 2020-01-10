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

    
    // MARK: -Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupBind()
        setupFetch()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print(viewModel.selectedGenres.joined(separator: ","))
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
        
//        if viewModel.selectGenreAt(index: indexPath.row) {
//            (tableView.cellForRow(at: indexPath) as! GenreTableViewCell).selectedStyle()
//            viewModel.selectedGenres.append(viewModel.getGenreByIndex(index: indexPath.row).name)
//
//        } else {
//            (tableView.cellForRow(at: indexPath) as! GenreTableViewCell).unselectedStyle()
//            viewModel.selectedGenres.removeAll { $0 == viewModel.getGenreByIndex(index: indexPath.row).name }
//        }

        return cell
    }
    
    // MARK: - Tableview Delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if viewModel.selectGenreAt(index: indexPath.row) {
            (tableView.cellForRow(at: indexPath) as! GenreTableViewCell).selectedStyle()
            viewModel.selectedGenres.append(viewModel.getGenreByIndex(index: indexPath.row).name)
            
        } else {
            (tableView.cellForRow(at: indexPath) as! GenreTableViewCell).unselectedStyle()
            viewModel.selectedGenres.removeAll { $0 == viewModel.getGenreByIndex(index: indexPath.row).name }
        }
    }
    
    // MARK: - Functions
    func setupTableView() {
        tableView.addSubview(refresher)
    }
    
    private func setupBind() {
        viewModel.reloadTableView = self.tableView.reloadData
        viewModel.beginLoading = refresher.beginRefreshing
        viewModel.finishLoading = refresher.endRefreshing
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
