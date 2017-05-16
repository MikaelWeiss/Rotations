//
//  RepeatsPicker.swift
//  Rotations Prime
//
//  Created by Mikael Weiss on 4/7/17.
//  Copyright © 2017 Mikael Weiss. All rights reserved.
//

import UIKit

class RepeatsPicker: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var chosenInt: Int?
    @IBOutlet weak var firstPickerView: UIPickerView!
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
    var myArray = ["Hourly", "Daily", "Weekly", "Monthly"]
    var TimesArray = ["1AM","2AM","3AM","4AM","5AM","6AM","7AM","8AM","9AM","10AM","11AM","12AM","1PM","2PM","3PM","4PM","5PM","6PM","7PM","8PM","9PM","10PM","11PM","12PM"]
    var isPickerOpen = false
// MARK: - system stuff
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        firstPickerView.dataSource = self
        firstPickerView.delegate = self
//        Weekdays.set
        
    }
// MARK: - table view setup
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0 && indexPath.row == 1) || (indexPath.section == 0 && indexPath.row == 3){
            if (self.isPickerOpen) {
                firstPickerView.isHidden = false
                return 216;
            } else {
                firstPickerView.isHidden = true
                return 0;
            }
        } else {
            return super.tableView(tableView, heightForRowAt: indexPath)
        }
    }
    // MARK: - work on this: !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.section == 0 && indexPath.row == 0) {
            tableView.beginUpdates()
            
            self.isPickerOpen = !self.isPickerOpen // toggle the state
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
    // MARK: - work on this: !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            chosenInt = row + 1
            print(chosenInt!)
        default:
            switchTheDailyOrHour(what: myArray[row])
        }
    }
// MARK: - custome functions
    func switchTheDailyOrHour(what: String) {
        detailLable.text = what
        
    }
    func switchColor(isWhite: Bool, sender: UIButton) {
        if isWhite == true {
            sender.backgroundColor = UIColor(red:0.30, green:0.85, blue:0.39, alpha:1.0)
//            sender.titleLabel?.textColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)
            sender.setTitleColor(UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0), for: UIControlState.normal)
        }else if isWhite == false {
            sender.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)
//            sender.titleLabel?.textColor = UIColor(red:0.30, green:0.85, blue:0.39, alpha:1.0)
            sender.setTitleColor(UIColor(red:0.30, green:0.85, blue:0.39, alpha:1.0), for: UIControlState.normal)
        }
    }
}