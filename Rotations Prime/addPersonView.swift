//
//  addPersonView.swift
//  Rotations Prime
//
//  Created by Mikael Weiss on 3/13/17.
//  Copyright © 2017 Mikael Weiss. All rights reserved.
//

import UIKit
class addPersonView: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
//              var setup
    var isInMain = true
    
    var IsAddingAssignment = true
    
    var groupOrPerson = ["Assignment", "Person"]
    
    var names2: [String] = []
    
    var whatGroup = ""
    
//              Outlet Setup
    @IBOutlet weak var NamePicker: UIPickerView!
    
    @IBOutlet weak var AsignmentPicker: UIPickerView!
    
    @IBOutlet weak var EnteredObjectTextFeild: UITextField!
    
//              Action Setup
    @IBAction func BackPressed(_ sender: UIButton) {
        if isInMain == true {
            
            performSegue(withIdentifier: "FromAddToMain", sender: UIButton())
            
        }else {
            
            performSegue(withIdentifier: "FromAddToGroup", sender: UIButton())
            
        }
    }
    
// Add/Save
    
    @IBAction func saveButton(_ sender: UIButton) {
        if isInMain == true {
            
            if IsAddingAssignment == true {
                
                let AssignmentObject = UserDefaults.standard.object(forKey: "\(whatGroup)" + "Assignment")
                
                var Assignment: [String]
                
                if let tempItems = AssignmentObject as? [String] {
                    
                    Assignment = tempItems
                    
                    Assignment.append("\(EnteredObjectTextFeild.text!)")
                    
//                    names2 = Assignment
                    
                    print(Assignment)
                    
                } else {
                    
                    Assignment = [EnteredObjectTextFeild.text!]
                    print("THIS IS VERRY BAD")
                }
                
                UserDefaults.standard.set(Assignment, forKey: "\(whatGroup)" + "Assignment")
                
                EnteredObjectTextFeild.text = ""
            } else {
                
                let NameObject = UserDefaults.standard.object(forKey: "Name")
                
                var Name: [String]
                
                if let tempItems = NameObject as? [String] {
                    
                    Name = tempItems
                    
                    Name.append("\(EnteredObjectTextFeild.text!)")
                    names2.append("\(EnteredObjectTextFeild.text!)")
                    print(Name)
                    
                } else {
                    
                    Name = [EnteredObjectTextFeild.text!]
                    names2 = [EnteredObjectTextFeild.text!]
                    print("this shouldnt print")
                }
                
                UserDefaults.standard.set(Name, forKey: "Name")
                
                EnteredObjectTextFeild.text = ""
                
            }
        }else if isInMain == false {
            
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
//              PickerView setup
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return groupOrPerson.count
        default:
            return names2.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return groupOrPerson[row]
        default:
            return names2[row]
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            if row == 2 {
                NamePicker.isHidden = false
            }else {
                NamePicker.isHidden = true
            }
        }else if pickerView.tag == 2 {
            
            EnteredObjectTextFeild.text = names2[row]
            
        }
    }
//              system stuff
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
    }
}
