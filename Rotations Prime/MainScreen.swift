//
//  MainScreen.swift
//  Rotations Prime
//
//  Created by Mikael Weiss on 12/24/16.
//  Copyright © 2016 Mikael Weiss. All rights reserved.
//

import UIKit

class mainScreen: UIViewController, UITableViewDelegate, UITableViewDataSource {
// MARK: - Variable Setup
    var isInMain = true
    var isAddingName = false
    var canAdd = true
    var allPeople: [String] = []
    var theAssignments: [String] = []
    var whatGroup = ""
    var ifNoAssignment = "No Assignment!"
    var ifNoPerson = "No Person!"
// MARK: - Outlet Setup
    @IBOutlet weak var addButtonOu: UIBarButtonItem!
    @IBOutlet weak var tableview: UITableView!

    @IBAction func Lock(_ sender: UIBarButtonItem) {
        if canAdd == true {
            addButtonOu.isEnabled = true
        }else if canAdd == false {
            
            addButtonOu.isEnabled = false
            
        }
    }
// MARK: - Action Setup
    @IBAction func Edit(_ sender: UIBarButtonItem) {
        isAddingName = false
    }
    @IBAction func BackButton(_ sender: UIBarButtonItem) {
        isAddingName = false
        performSegue(withIdentifier: "BackButtonPressed", sender: UIBarButtonItem())
    }
    @IBAction func addPersonPressed(_ sender: UIBarButtonItem) {
        isAddingName = true
        performSegue(withIdentifier: "AddPerson", sender: UIBarButtonItem())
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
// MARK: - Table View Setup
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        apendNonAplicable()
        if allPeople.count == theAssignments.count {
            return allPeople.count
        }else {
            apendNonAplicable()
            print("else in number of rows in section BAD")
            return allPeople.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PeopleTVCell", for: indexPath)
        cell.textLabel?.text = theAssignments[indexPath.row]
        cell.detailTextLabel?.text = allPeople[indexPath.row]
        return cell
    }
// MARK: - System setup
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableview.allowsSelection = false
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if isAddingName == true {
            
            let addPerson = segue.destination as! addPersonView
            addPerson.isInMain = true
            addPerson.whatGroup = whatGroup
            
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        let NamesObject = UserDefaults.standard.object(forKey: "Name")
        
        if let tempItems = NamesObject as? [String] {
            
            allPeople = tempItems
            
            print("saved data in main (Name)")
        }
        let AssignmentObject = UserDefaults.standard.object(forKey: whatGroup + "Assignment")
        
        if let tempItems = AssignmentObject as? [String] {
            
            theAssignments = tempItems
            
            print("saved data in main (Assignments)")
        }
        
        tableview.reloadData()
    }
// MARK: - the Exit Segue
    @IBAction func exitSegue(segue: UIStoryboardSegue) {
        tableview.reloadData()
        print("Exited to main")
    }


// MARK: - Costom functions

    func apendNonAplicable() {
        if allPeople.count < theAssignments.count {
            while allPeople.count < theAssignments.count {
                allPeople.append(ifNoPerson)
            }
        }else if allPeople.count > theAssignments.count {
            while allPeople.count > theAssignments.count {
                theAssignments.append(ifNoAssignment)
            }
        }
    }

}
