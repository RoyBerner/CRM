//
//  ViewController.swift
//  Table
//
//  Created by Roy Berner on 05/01/2018.
//  Copyright © 2018 Roy Berner. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBAction func backMain(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    var opleiding = [Opleiding]()
    var filterOpleiding = [Opleiding]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJSON {
            print("success")
            self.tableView.reloadData()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Setup the Search Controller
        searchController.searchResultsUpdater = self as UISearchResultsUpdating
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "zoek opleiding"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filterOpleiding.count
        }
        return opleiding.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        //cell.textLabel?.text = opleiding[indexPath.row].naam_opleiding?.capitalized
        //return cell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let opleid : Opleiding
        if isFiltering() {
            opleid = filterOpleiding[indexPath.row]
        } else {
            opleid = opleiding[indexPath.row]
        }
        cell.textLabel!.text = opleid.naam_opleiding
        //cell.detailTextLabel!.text = candy.category
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = (segue.destination as? UITabBarController)?.viewControllers?.first as? OpleidingVC{
            if isFiltering() {
            destination.opleiding = filterOpleiding[(tableView.indexPathForSelectedRow?.row)!]
            } else {
                destination.opleiding = opleiding[(tableView.indexPathForSelectedRow?.row)!]
            }
    }
    }
    

    
    
    func downloadJSON(completed: @escaping () -> ()) {
        
        let url = URL(string: "https://royberner.nl/CRM/php/opleidingJSON.php")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                do {
                    self.opleiding = try JSONDecoder().decode([Opleiding].self, from: data!)
                    
                    DispatchQueue.main.async {
                        completed()
                    }
                } catch {
                    print("JSON error")
                }
            }
            }.resume()
    }
    
    // MARK: - Private instance methods
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
        
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filterOpleiding = opleiding.filter({( opleid : Opleiding) -> Bool in
            return opleid.naam_opleiding!.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
}

extension ViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
     func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
