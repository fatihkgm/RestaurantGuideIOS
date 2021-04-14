//
//  SearchTableViewController.swift
//  RestaurantGuide_IOS
//
//  Created by Fatih on 2021-04-14.
//

import UIKit

class SearchTableViewController: UITableViewController {
    
    let data = ["McDonalds" , "Hasty Market" , "Mexi Restaurant" ,"Your Home" , "AirPort Restaurant","KFC","SUSHI Market" , "Tim Hortons","Five Starts","Brothers Cafe"]

    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        title="Seach Your Restaurant"
        

        
    }

 

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        
        cell.textLabel?.text = data[indexPath.row]
        
        return cell
    }

    

}
