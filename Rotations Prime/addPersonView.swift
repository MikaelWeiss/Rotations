//
//  addPersonView.swift
//  Rotations Prime
//
//  Created by Mikael Weiss on 3/13/17.
//  Copyright © 2017 Mikael Weiss. All rights reserved.
//

import UIKit
class addPersonView: UIViewController {
    var isInMain = true

    
    @IBOutlet weak var EnteredObjectTextFeild: UITextField!
    
    @IBAction func cancelPressed(_ sender: UIButton) {
        if isInMain == true {
            
            performSegue(withIdentifier: "FromAddToMain", sender: UIButton())
            
        }else {
            
            performSegue(withIdentifier: "FromAddToGroup", sender: UIButton())
            
        }
    }
    
    // add/save           DONE
    @IBAction func saveButton(_ sender: UIButton) {
        if isInMain == true {
            
            let namesObject = UserDefaults.standard.object(forKey: "Names")
            
            var names: [String]
            
            if let tempItems = namesObject as? [String] {
                
                names = tempItems
                
                names.append(EnteredObjectTextFeild.text!)
                
                print(names)
                
            } else {
                
                names = [EnteredObjectTextFeild.text!]
                
            }
            
            UserDefaults.standard.set(names, forKey: "Names")
            
            EnteredObjectTextFeild.text = ""
            
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
