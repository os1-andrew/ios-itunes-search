//
//  SearchResultsTableViewController.swift
//  iTunes Search
//
//  Created by Andrew Dhan on 8/7/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

import UIKit

class SearchResultsTableViewController: UITableViewController, UISearchBarDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else {return}
        var resultType:ResultType?
        
        let index = segmentedControl.selectedSegmentIndex
        switch index {
        case 0:
            resultType = .software
        case 1:
            resultType = .musicTrack
        default:
            resultType = .movie
        }
        
        guard let type = resultType else {return}
        searchResultsController.performSearch(searchTerm: searchTerm, resultType: type) { (error) -> Void in
            if let error = error{
                NSLog("Error performing search: \(error)")
                return
            }
            DispatchQueue.main.async {
                 self.tableView.reloadData()
            }
           
        }
        
    }
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return searchResultsController.searchResults.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath)
        let result = searchResultsController.searchResults[indexPath.row]
        
        cell.textLabel?.text = result.title
        cell.detailTextLabel?.text = result.creator
        
        
        return cell
    }
    
    //MARK: - Properties
    var searchResultsController = SearchResultController()
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
}
