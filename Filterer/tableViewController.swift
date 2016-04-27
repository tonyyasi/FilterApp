//
//  tableViewController.swift
//  Filterer
//
//  Created by Tony Toussaint on 4/19/16.
//  Copyright © 2016 Tony Toussaint. All rights reserved.
//

import UIKit

class tableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView!
    
    let filters = [ "Red", "Blue", "Green", "Yellow"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(filters[indexPath.row])
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filters.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FilterCell", forIndexPath: indexPath)
        cell.textLabel!.text = filters[indexPath.row]
        return cell
    }

}