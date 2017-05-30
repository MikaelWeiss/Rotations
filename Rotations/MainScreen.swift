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
    var isAddingName = 2
    var allPeople: [String] = []
    var theAssignments: [String] = []
    var whatGroup = ""
    var ifNoAssignment = "No Assignment"
    var ifNoPerson = "No Person"
    
// MARK: - Outlet Setup

    @IBOutlet weak var navBarOutlet: UINavigationItem!
    @IBOutlet weak var tableview: UITableView!
// MARK: - Action Setup
   
    @IBAction func Edit(_ sender: UIBarButtonItem) {
        isAddingName = 3
        performSegue(withIdentifier: "whatsUp", sender: UIBarButtonItem())
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
        navBarOutlet.title = whatGroup
        tableview.allowsSelection = false
        tableview.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        tableview.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 
        if isAddingName == 3 {
            let TheEditScreen = segue.destination as! EditScreen
            TheEditScreen.whatGroup = whatGroup
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        
        let NamesObject = UserDefaults.standard.object(forKey: "Name" + whatGroup)
        
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
        if UserDefaults.standard.object(forKey: "Name" + whatGroup) != nil {
        allPeople = UserDefaults.standard.array(forKey: "Name" + whatGroup) as! [String]
        }
        if UserDefaults.standard.object(forKey: whatGroup + "Assignment") != nil {
        theAssignments = UserDefaults.standard.array(forKey: whatGroup + "Assignment") as! [String]
        }
        tableview.reloadData()
        isAddingName = 2
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
    func reorderArray(theArray: [String]) {
        for _ in theArray {
            var diceRoll1 = Int(arc4random_uniform(UInt32(theArray.count)) + 1)
            var diceRoll2 = Int(arc4random_uniform(UInt32(theArray.count)) + 1)
            var myArray = allPeople
            if diceRoll1 != diceRoll2 {
                // Swap elements at index: 2 and 3
                print(myArray)
                swap(&myArray[diceRoll1], &myArray[diceRoll2])
                print(myArray)
            }else {
                diceRoll1 = Int(arc4random_uniform(UInt32(theArray.count)) + 1)
                diceRoll2 = Int(arc4random_uniform(UInt32(theArray.count)) + 1)
                if diceRoll1 != diceRoll2 {
                    // Swap elements at index: 2 and 3
                    print(myArray)
                    swap(&myArray[diceRoll1], &myArray[diceRoll2])
                    print(myArray)
                }
            }
            UserDefaults.standard.set(allPeople, forKey: "Name" + whatGroup)
            tableview.reloadData()
        }
    }
    func loadList(notification: NSNotification){
        //load data here
        tableview.reloadData()
    }
    

}
