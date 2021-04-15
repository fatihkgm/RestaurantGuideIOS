//
//  SearchTableViewController.swift
//  RestaurantGuide_IOS
//
//  Created by Fatih on 2021-04-14.
//

import UIKit

class SearchTableViewController: UITableViewController,UISearchBarDelegate {
    
    let data = ["McDonalds" , "Hasty Market" , "Mexi Restaurant" ,"Your Home" , "AirPort Restaurant","KFC","SUSHI Market" , "Tim Hortons","Five Starts","Brothers Cafe"]
    var filteredData: [String]!
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        title="Seach Your Restaurant"
        
        searchBar.delegate = self
        filteredData = data
        
        
    }

 

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return filteredData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        
        cell.textLabel?.text = filteredData[indexPath.row]
        
        return cell
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = []
        if searchText == "" {
            filteredData = data
        }
        else {
        for restaurant in data {
            if restaurant.lowercased().contains(searchText.lowercased()){
                filteredData.append(restaurant)
            }
        }
        }
        self.tableView.reloadData()
    }

}
