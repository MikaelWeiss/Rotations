//
//  MainScreen.swift
//  Rotations Prime
//
//  Created by Mikael Weiss on 12/24/16.
//  Copyright © 2016 Mikael Weiss. All rights reserved.
//

import UIKit

class mainScreen: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var isInMain = true
    var isAddingName = false
    var canAdd = true
    var allPeople = ["Mikael", "Grant", "Rachel"]
    var whatGroup = ""
    @IBOutlet weak var addButtonOu: UIBarButtonItem!
    
    @IBAction func Lock(_ sender: UIBarButtonItem) {
        if canAdd == true {
            addButtonOu.isEnabled = true
        }else if canAdd == false {
            
            addButtonOu.isEnabled = false
            
        }
    }
    
    @IBAction func BackButton(_ sender: UIBarButtonItem) {
        isAddingName = false
        performSegue(withIdentifier: "BackButtonPressed", sender: UIBarButtonItem())
    }
    @IBAction func addPersonPressed(_ sender: UIBarButtonItem) {
        isAddingName = true
        performSegue(withIdentifier: "AddPerson", sender: UIBarButtonItem())
    }
    
    @IBOutlet weak var tableview: UITableView!
    
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
            
            print("saved data in main")
        }
        
        tableview.reloadData()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allPeople.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PeopleTVCell", for: indexPath)
        
        cell.textLabel?.text = "Hello"
        cell.detailTextLabel?.text = "World"
        
        return cell
    }
    
    @IBAction func exitSegue(segue: UIStoryboardSegue) {
        
    }
}

