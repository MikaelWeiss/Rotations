//
//  addPersonView.swift
//  Rotations Prime
//
//  Created by Mikael Weiss on 3/13/17.
//  Copyright © 2017 Mikael Weiss. All rights reserved.
//

import UIKit
class addPersonView: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
// MARK: - var setup
    var isInMain = true
    
    var IsAddingAssignment = true
    
    var groupOrPerson = ["Assignment", "Person"]
    
    var namesForEachGroup: [String] = []
    
    var AllNames: [String] = ["names will show up here"]
    
    var whatGroup = ""
    
    
// MARK: - Outlet Setup
    @IBOutlet weak var NamePicker: UIPickerView!
    
    @IBOutlet weak var AsignmentPicker: UIPickerView!
    
    @IBOutlet weak var EnteredObjectTextFeild: UITextField!
    
// MARK: - Action Setup
    @IBAction func BackPressed(_ sender: UIButton) {
        if isInMain == true {
            
            performSegue(withIdentifier: "FromAddToMain", sender: UIButton())
            
        }else {
            
            performSegue(withIdentifier: "FromAddToGroup", sender: UIButton())
            
        }
    }
    
// MARK: - Add/Save
    
    @IBAction func saveButton(_ sender: UIButton) {
        if isInMain == true {
            
            if IsAddingAssignment == true {
// MARK: Add Assignment
                let AssignmentObject = UserDefaults.standard.object(forKey: "\(whatGroup)" + "Assignment")
                
                var Assignment: [String]
                
                if let tempItems = AssignmentObject as? [String] {
                    
                    Assignment = tempItems
                    
                    Assignment.append("\(EnteredObjectTextFeild.text!)")
                    
                    print(Assignment)
                    
                } else {
                    
                    Assignment = [EnteredObjectTextFeild.text!]
                    print("THIS IS VERRY BAD 0")
                }
                
                UserDefaults.standard.set(Assignment, forKey: "\(whatGroup)" + "Assignment")
                
                EnteredObjectTextFeild.text = ""
            }else {
// MARK: Add Name
                if AllNames.contains("\(EnteredObjectTextFeild.text)"){
                    print("saving to this group")
                    addNameToGroup()
                }else {
                    let NameObject = UserDefaults.standard.object(forKey: "Name")
                    
                    var Name: [String]
                    
                    if let tempItems = NameObject as? [String] {
                        
                        Name = tempItems
                        
                        Name.append("\(EnteredObjectTextFeild.text!)")
                        
                        print(Name)
                        
                    } else {
                        
                        Name = [EnteredObjectTextFeild.text!]
                        print("THIS IS VERRY BAD")
                    }
                    
                    UserDefaults.standard.set(Name, forKey: "Name")
                    addNameToGroup()
                    EnteredObjectTextFeild.text = ""
                }
                
            }
            }else if isInMain == false {
// MARK: Add Group
                let groupsObject = UserDefaults.standard.object(forKey: "Groups")
                
                var groups: [String]
                
                if let tempItems = groupsObject as? [String] {
                    
                    groups = tempItems
                    
                    groups.append(EnteredObjectTextFeild.text!)
                    
                    print(groups)
                    
                } else {
                    
                    groups = [EnteredObjectTextFeild.text!]
                    
                }
                
                UserDefaults.standard.set(groups, forKey: "Groups")
                
                EnteredObjectTextFeild.text = ""
                
                
            }
            
        }
// MARK: Add Name func
    func addNameToGroup() {
        let nameObject = UserDefaults.standard.object(forKey: "Name" + whatGroup)
        
        var NameForGroup: [String]
        
        if let tempItems = nameObject as? [String] {
            
            NameForGroup = tempItems
            
            NameForGroup.append("\(EnteredObjectTextFeild.text!)")
            
            print(NameForGroup)
            
        } else {
            
            NameForGroup = [EnteredObjectTextFeild.text!]
            print("THIS IS VERRY BAD 1")
        }
        
        UserDefaults.standard.set(NameForGroup, forKey: "Name" + whatGroup)
        print("saved to group")
        EnteredObjectTextFeild.text = ""
    }
// MARK: - PickerView setup
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            switch pickerView.tag {
            case 1:
                return groupOrPerson.count
            default:
                return AllNames.count
            }
        }
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            switch pickerView.tag {
            case 1:
                return groupOrPerson[row]
            default:
                return AllNames[row]
            }
            
        }
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            
            if pickerView.tag == 1 {
                if row == 1 {
                    NamePicker.isHidden = false
                    IsAddingAssignment = false
                }else {
                    NamePicker.isHidden = true
                    IsAddingAssignment = true
                }
            }
            
            if pickerView.tag == 2 {
                
                EnteredObjectTextFeild.text = AllNames[row]
                
            }
        }
// MARK: - system stuff
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            AsignmentPicker.dataSource = self
            AsignmentPicker.delegate = self
            NamePicker.dataSource = self
            NamePicker.delegate = self
            NamePicker.isHidden = true
            NamePicker.tag = 2
            AsignmentPicker.tag = 1
            
            if isInMain == true {
                
                AsignmentPicker.isHidden = false
                
            }else if isInMain == false {
                
                AsignmentPicker.isHidden = true
                NamePicker.isHidden = true
            }
            let NameObject = UserDefaults.standard.object(forKey: "Name")
            if let tempItems = NameObject as? [String] {
                AllNames = tempItems
                print(AllNames)
                
            } else {
                print("this shouldnt print 2")
            }
            IsAddingAssignment = true
        }
}
