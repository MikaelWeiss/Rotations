//
//  RepeatsPicker.swift
//  Rotations Prime
//
//  Created by Mikael Weiss on 4/7/17.
//  Copyright © 2017 Mikael Weiss. All rights reserved.
//

import UIKit

class RepeatsPicker: UITableViewController {
    @IBOutlet weak var firstPickerView: UIPickerView!
    
    @IBOutlet weak var detailLable: UILabel!
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "EditTimesToEdit", sender: UIBarButtonItem())
    }
    
    //    @IBAction func datePickerValue(sender: UIPickerView) {
    //        datePickerChanged(row: firstPickerView.selectedRow(inComponent: 1))
    //    }
    var myArray = ["Hourly", "Daily", "Weekly", "Monthly", "Yearly"]
    var myArray2 = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        datePickerChanged(row: 1)
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
    var datePickerHidden = false
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if datePickerHidden && indexPath.section == 0 && indexPath.row == 1 {
            return 0
        }
        else {
            return tableView.rowHeight
            // MARK: this might not work
        }
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            toggleDatepicker()
        }
    }
    func toggleDatepicker() {
        
        datePickerHidden = !datePickerHidden
        
        tableView.beginUpdates()
        tableView.endUpdates()
        
    }
    func datePickerChanged (row: Int) {
        detailLable.text = myArray[row]
    }
}
