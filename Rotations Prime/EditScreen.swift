//
//  EditScreen.swift
//  Rotations Prime
//
//  Created by Mikael Weiss on 4/4/17.
//  Copyright © 2017 Mikael Weiss. All rights reserved.
//

import UIKit

class EditScreen: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var PeopleForGroup = [String]()
    var theAssignments = [String]()
    var whatGroup = ""
    var whatNameName = ""
    var whatNameAssignments = ""
    var isAddingName = 1
    
    
    @IBAction func RepeatsButton(_ sender: UIBarButtonItem) {
        isAddingName = 2
    }
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        isAddingName = 1
        performSegue(withIdentifier: "AddPerson1", sender: UIBarButtonItem())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myTableView.allowsSelection = false
        
        let NamesObject = UserDefaults.standard.object(forKey: "Name" + whatGroup)
        
        if let tempItems = NamesObject as? [String] {
            
            PeopleForGroup = tempItems
            
            print("saved data in main (Name)")
        }
        let AssignmentObject = UserDefaults.standard.object(forKey: whatGroup + "Assignment")
        
        if let tempItems = AssignmentObject as? [String] {
            
            theAssignments = tempItems
            
            print("saved data in main (Assignments)")
        }
        
        self.navigationItem.leftItemsSupplementBackButton = true
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if isAddingName == 1 {
            
            let addPerson = segue.destination as! addPersonView
            addPerson.isInMain = true
            addPerson.whatGroup = whatGroup
            
        }
    }
    
// MARK: - Table View Setup
    
    @IBOutlet weak var myTableView: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return "Assignments"
        default:
            return "Names"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 1:
            return theAssignments.count
        default:
            return PeopleForGroup.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        switch indexPath.section {
        case 0:
            print("case 1")
            print(PeopleForGroup)
            cell.textLabel?.text = PeopleForGroup[indexPath.row]
            print("works 1")
        default:
            print("default")
            print(theAssignments)
            cell.textLabel?.text = theAssignments[indexPath.row]
            print("works 2")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            if editingStyle == .delete {
                PeopleForGroup.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                tableView.reloadData()
                
                UserDefaults.standard.set(theAssignments, forKey: whatGroup + "Assignment")
                UserDefaults.standard.set(PeopleForGroup, forKey: "Name" + whatGroup)
                print(PeopleForGroup)
            } else if editingStyle == .insert {
                // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
            }
        default:
            if editingStyle == .delete {
                theAssignments.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                tableView.reloadData()
                
                UserDefaults.standard.set(theAssignments, forKey: whatGroup + "Assignment")
                UserDefaults.standard.set(PeopleForGroup, forKey: "Name" + whatGroup)
                print(theAssignments)
            } else if editingStyle == .insert {
                // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
            }
        }
    }
// MARK: - custome functions
    
// MARK: - Exit segue
    @IBAction func GoToEdit(segue: UIStoryboardSegue) {
        if UserDefaults.standard.object(forKey: "Name" + whatGroup) != nil {
            PeopleForGroup = UserDefaults.standard.array(forKey: "Name" + whatGroup) as! [String]
        }
        if UserDefaults.standard.object(forKey: whatGroup + "Assignment") != nil {
            theAssignments = UserDefaults.standard.array(forKey: whatGroup + "Assignment") as! [String]
        }
        myTableView.reloadData()
        isAddingName = 2
        print("Exited to Edit")
    }

}
