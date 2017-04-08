//
//  RotationPicker.swift
//  Rotations Prime
//
//  Created by Mikael Weiss on 4/7/17.
//  Copyright © 2017 Mikael Weiss. All rights reserved.
//

import UIKit

class RotationPicker: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var firstPickerView: UIPickerView!
    @IBOutlet weak var SeccondPickerView: UIPickerView!
    
    var myArray = ["Hourly", "Daily", "Weekly", "Monthly", "Yearly"]
    var myArray2 = [String]()
    
    @IBAction func CancelButton(_ sender: UIButton) {
        performSegue(withIdentifier: "editDateToEdit", sender: UIButton())
    }
    @IBAction func SaveButton(_ sender: UIButton) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myArray2 = [""]
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return myArray.count
        case 2:
            return myArray2.count
        default:
            return myArray.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return myArray[row]
        case 2:
            return myArray2[row]
        default:
            return myArray[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            print("Sup")
        default:
            myArray2 = [""]
        }
    }
}
