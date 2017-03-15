//
//  MainScreen.swift
//  Rotations Prime
//
//  Created by Mikael Weiss on 12/24/16.
//  Copyright © 2016 Mikael Weiss. All rights reserved.
//

import UIKit

class mainScreen: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBAction func addPersonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "AddPerson", sender: UIButton())
    }
    @IBOutlet weak var tableview: UITableView!
    
    var allPeople = ["Rachel", "Mikael", "Grant"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allPeople.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PeopleTVCell", for: indexPath)
        
        cell.textLabel?.text = "balah"
        cell.detailTextLabel?.text = "basdf"
        
        return cell
    }
    
    @IBAction func exitSegue(segue: UIStoryboardSegue) {
        
    }
}

