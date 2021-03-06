//
//  groupSelect.swift
//  Rotations Prime
//
//  Created by Mikael Weiss on 3/14/17.
//  Copyright © 2017 Mikael Weiss. All rights reserved.
//

import UIKit

class groupSelect: UIViewController, UITableViewDataSource, UITableViewDelegate {
// MARK: - Varable Setup
    var theGroups: [String] = []
    
    var emptyArray = [""]
    
    var isAddingGroup = 1
    
    var whatGroup = ""

// MARK: - Outlets
    @IBOutlet weak var GroupTableView: UITableView!
    @IBOutlet weak var addButtonO: UIBarButtonItem!
// MARK: - Actions
    @IBAction func addingButton(_ sender: UIBarButtonItem) {
        isAddingGroup = 1
        performSegue(withIdentifier: "GroupToAdd", sender: UIBarButtonItem())
    }
    @IBAction func EditButton(_ sender: UIBarButtonItem) {
        isAddingGroup = 3
        performSegue(withIdentifier: "GroupsToEditAllNames", sender: UIBarButtonItem())
    }
    
// MARK: - Table View Setup
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
        isAddingGroup = 2
        whatGroup = theGroups[indexPath.row]
        performSegue(withIdentifier: "GroupToMain", sender: UITableViewCell())
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            whatGroup = theGroups[indexPath.row]
            theGroups.remove(at: indexPath.row)
            
            GroupTableView.reloadData()
            
            UserDefaults.standard.set(theGroups, forKey: "Groups")
            if UserDefaults.standard.object(forKey: "Name" + whatGroup) != nil {
                UserDefaults.standard.removeObject(forKey: "Name" + whatGroup)
            }
            if UserDefaults.standard.object(forKey: whatGroup + "Assignment") != nil {
                UserDefaults.standard.removeObject(forKey: whatGroup + "Assignment")
            }
            
            print(theGroups)
        }
    }
// MARK: - System stuff
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let itemsObject = UserDefaults.standard.object(forKey: "Groups")
        
        if let tempItems = itemsObject as? [String] {
            
            theGroups = tempItems
            print("saved data")
        }
        
        GroupTableView.reloadData()
        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if isAddingGroup == 1 {
            // is in main = false
            let addPerson = segue.destination as! addPersonView
            addPerson.isInMain = false
            
        }else if isAddingGroup == 2 {
            
            let mainScreenVar = segue.destination as! mainScreen
            mainScreenVar.whatGroup = whatGroup
            mainScreenVar.isAddingName = 2
        }else if isAddingGroup == 3 {
            let editAllNamesScreen = segue.destination as! EditAllNames
            if let names = UserDefaults.standard.object(forKey: "Name") {
                editAllNamesScreen.allNames = names as! [String]
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        GroupTableView.reloadData()
    }
// MARK: get to groups segue
    @IBAction func goToGroupScreenSegue(Segue: UIStoryboardSegue) {
        if UserDefaults.standard.object(forKey: "Groups") != nil {
            theGroups = UserDefaults.standard.array(forKey: "Groups") as! [String]
        }
        GroupTableView.reloadData()
    }
    
}
