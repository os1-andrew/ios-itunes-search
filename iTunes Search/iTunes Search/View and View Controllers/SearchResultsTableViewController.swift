//
//  SearchResultsTableViewController.swift
//  iTunes Search
//
//  Created by Andrew Dhan on 8/7/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

import UIKit

class SearchResultsTableViewController: UITableViewController {

   

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
 
    //MARK: - Properties
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
}
