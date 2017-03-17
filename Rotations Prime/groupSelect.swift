//
//  groupSelect.swift
//  Rotations Prime
//
//  Created by Mikael Weiss on 3/14/17.
//  Copyright © 2017 Mikael Weiss. All rights reserved.
//

import UIKit

class groupSelect: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var theGroups: [String] = []
    var isAddingGroup = false
    var canAdd = true
    
    @IBOutlet weak var addButtonO: UIBarButtonItem!
    @IBAction func addingButton(_ sender: UIBarButtonItem) {
        isAddingGroup = true
        performSegue(withIdentifier: "GroupToAdd", sender: UIBarButtonItem())
    }
    @IBAction func Lock(_ sender: UIBarButtonItem) {
        if canAdd == true {
            addButtonO.isEnabled = true
        }else if canAdd == false {
            
            addButtonO.isEnabled = false
            
        }
    }
    
    @IBAction func goToGroupScreenSegue(Segue: UIStoryboardSegue) {
    }

    @IBOutlet weak var GroupTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if isAddingGroup == true {
            
            let addPerson = segue.destination as! addPersonView
            addPerson.isInMain = false
            
        }
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        isAddingGroup = false
        performSegue(withIdentifier: "GroupToMain", sender: UITableViewCell())
    }
    override func viewDidAppear(_ animated: Bool) {
        let itemsObject = UserDefaults.standard.object(forKey: "Groups")
        
        print("vvv")
        if let tempItems = itemsObject as? [String] {
            
            theGroups = tempItems
            print("viv")
        }
        
        GroupTableView.reloadData()
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            theGroups.remove(at: indexPath.row)
            
            GroupTableView.reloadData()
            
            UserDefaults.standard.set(theGroups, forKey: "Groups")
        }
    }
    
    
}
