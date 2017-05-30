//
//  EditAllNames.swift
//  Rotations
//
//  Created by Mikael Weiss on 5/27/17.
//  Copyright © 2017 Mikael Weiss. All rights reserved.
//

import UIKit

class EditAllNames: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var allNames = ["All Names"]
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.object(forKey: "Name") != nil{
            allNames = UserDefaults.standard.object(forKey: "Name") as! [String]
        }else {allNames = ["No Names Created"]}
        print("allNames in")
        // Do any additional setup after loading the view.
    }
// MARK: - Table view setup
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return "Assignments"
        default:
            return "Names"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EditCell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = allNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
            let item = allNames[sourceIndexPath.row]
            allNames.remove(at: sourceIndexPath.row)
            allNames.insert(item, at: destinationIndexPath.row)
            UserDefaults.standard.set(allNames, forKey: "Name")
            print("Moved all People")
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                allNames.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                tableView.reloadData()
                UserDefaults.standard.set(allNames, forKey: "Name")
                print(allNames)
        }
    }

}
