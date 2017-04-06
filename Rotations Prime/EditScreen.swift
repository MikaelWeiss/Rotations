//
//  EditScreen.swift
//  Rotations Prime
//
//  Created by Mikael Weiss on 4/4/17.
//  Copyright © 2017 Mikael Weiss. All rights reserved.
//

import UIKit

class EditScreen: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var allPeople = [String]()
    var theAssignments = [String]()
    var whatGroup = ""
    var whatNameName = ""
    var whatNameAssignments = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let NamesObject = UserDefaults.standard.object(forKey: "Name" + whatGroup)
        
        if let tempItems = NamesObject as? [String] {
            
            allPeople = tempItems
            whatNameName = "Name" + whatGroup
            print("saved data in main (Name)")
        }
        let AssignmentObject = UserDefaults.standard.object(forKey: whatGroup + "Assignment")
        
        if let tempItems = AssignmentObject as? [String] {
            
            theAssignments = tempItems
            whatNameAssignments = whatGroup + "Assignments"
            print("saved data in main (Assignments)")
        }
        
    }
// MARK: - Table View Setup
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
            return allPeople.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 1:
            if editingStyle == .delete {
                theAssignments.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                theAssignments.remove(at: indexPath.row)
                
                tableView.reloadData()
                
                UserDefaults.standard.set(theAssignments, forKey: whatGroup + "Assignment")
                print(theAssignments)
            } else if editingStyle == .insert {
                // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
            }
        default:
            if editingStyle == .delete {
                allPeople.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                allPeople.remove(at: indexPath.row)
                
                tableView.reloadData()
                
                UserDefaults.standard.set(theAssignments, forKey: whatGroup + "Assignment")
                print(theAssignments)
            } else if editingStyle == .insert {
                // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
            }
        }
    }

}
