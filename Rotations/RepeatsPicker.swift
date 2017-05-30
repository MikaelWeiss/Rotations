//
//  RepeatsPicker.swift
//  Rotations Prime
//
//  Created by Mikael Weiss on 4/7/17.
//  Copyright © 2017 Mikael Weiss. All rights reserved.
//

import UIKit

class RepeatsPicker: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var chosenInt = 1
    @IBOutlet weak var firstPickerView: UIPickerView!
    @IBOutlet weak var SecondPicker: UIDatePicker!
    @IBOutlet weak var detailLable: UILabel!
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "EditTimesToEdit", sender: UIBarButtonItem())
    }
    @IBOutlet var Weekdays: [UIButton]!
    @IBAction func RepeatWeeklyPressed(_ sender: UIButton) {
        if sender.backgroundColor == UIColor(red:0.30, green:0.85, blue:0.39, alpha:1.0) {
            switchColor(isWhite: false, sender: sender)
        }else {
            switchColor(isWhite: true, sender: sender)
        }
    print("Pressed a repeat button")
    }
    var myArray = ["Hour", "Day", "Week", "Month"]
    var whichInMyArray = 0
    var TimesArray = ["1AM","2AM","3AM","4AM","5AM","6AM","7AM","8AM","9AM","10AM","11AM","12AM","1PM","2PM","3PM","4PM","5PM","6PM","7PM","8PM","9PM","10PM","11PM","12PM"]
    var isFirstPickerOpen = false
    var isSecondPickerOpen = false
    var isFirst = true
// MARK: - system stuff
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        firstPickerView.dataSource = self
        firstPickerView.delegate = self
//        Weekdays.set
        switchTheDailyOrHour()
        
    }
// MARK: - table view setup
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 1:
                if isFirstPickerOpen {
                    firstPickerView.isHidden = false
                    return 216
                }else {
                    return 0
                }
        case 3:
                if isSecondPickerOpen {
                    SecondPicker.isHidden = false
                    return 216
                }else {
                    return 0
                }
        default:
            return super.tableView(tableView, heightForRowAt: indexPath)
        }
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.section == 0 && indexPath.row == 0) {
            isFirst = true
            tableView.beginUpdates()
            
            self.isFirstPickerOpen = !self.isFirstPickerOpen // toggle the state
            // this causes the cell height to be re-evaluated and therefore changed based on the new boolean state.
            super.tableView(tableView, heightForRowAt: indexPath)
            tableView.endUpdates()
        }else if (indexPath.section == 0 && indexPath.row == 2) {
            isFirst = false
            tableView.beginUpdates()
            
            self.isSecondPickerOpen = !self.isSecondPickerOpen // toggle the state
            // this causes the cell height to be re-evaluated and therefore changed based on the new boolean state.
            super.tableView(tableView, heightForRowAt: indexPath)
            tableView.endUpdates()
        }
    }
// MARK: - pickerViewSetup
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 100
        default:
            return myArray.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return String(row + 1)
        default:
            return myArray[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            chosenInt = row + 1
            switchTheDailyOrHour()
        default:
            whichInMyArray = row
            switchTheDailyOrHour()
        }
    }
    
// MARK: - custome functions
    func switchTheDailyOrHour() {
        detailLable.text = String(String(chosenInt) + " Times Every " + myArray[whichInMyArray])
        
    }
    func switchColor(isWhite: Bool, sender: UIButton) {
        if isWhite == true {
            sender.backgroundColor = UIColor(red:0.30, green:0.85, blue:0.39, alpha:1.0)
            sender.setTitleColor(UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0), for: UIControlState.normal)
        }else if isWhite == false {
            sender.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)
            sender.setTitleColor(UIColor(red:0.30, green:0.85, blue:0.39, alpha:1.0), for: UIControlState.normal)
        }
    }
}
