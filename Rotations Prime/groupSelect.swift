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
    
    var whatGroup = ""

//              Outlets
    @IBOutlet weak var GroupTableView: UITableView!
    @IBOutlet weak var addButtonO: UIBarButtonItem!
//              Actions
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
        performSegue(withIdentifier: "GroupToLock", sender: UIBarButtonItem())
    }
//              table View setup
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
        whatGroup = theGroups[indexPath.row]
        performSegue(withIdentifier: "GroupToMain", sender: UITableViewCell())
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            theGroups.remove(at: indexPath.row)
            
            GroupTableView.reloadData()
            
            UserDefaults.standard.set(theGroups, forKey: "Groups")
            print(theGroups)
        }
    }
//              system stuff
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        let itemsObject = UserDefaults.standard.object(forKey: "Groups")
        
        if let tempItems = itemsObject as? [String] {
            
            theGroups = tempItems
            print("saved data")
        }
        
        GroupTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if isAddingGroup == true {
            // is in main = false
            let addPerson = segue.destination as! addPersonView
            addPerson.isInMain = false
            
        }else if isAddingGroup == false {
            
            let mainScreenVar = segue.destination as! mainScreen
            mainScreenVar.whatGroup = whatGroup
            
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        GroupTableView.reloadData()
    }
//              get to groups segue
    @IBAction func goToGroupScreenSegue(Segue: UIStoryboardSegue) {
        GroupTableView.reloadData()
    }
    
}
