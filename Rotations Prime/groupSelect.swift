//
//  groupSelect.swift
//  Rotations Prime
//
//  Created by Mikael Weiss on 3/14/17.
//  Copyright © 2017 Mikael Weiss. All rights reserved.
//

import UIKit

class groupSelect: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var theGroups = [";alksjdfa", "a;kdjsf", "al;kdfsj"]

    @IBOutlet weak var GroupTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theGroups.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath)
        cell.textLabel?.text = theGroups[indexPath.row]
        return cell
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: GroupToMain, sender: AnyObject)
//    }

    
    
}
