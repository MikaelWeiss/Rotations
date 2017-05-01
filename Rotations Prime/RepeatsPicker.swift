//
//  RepeatsPicker.swift
//  Rotations Prime
//
//  Created by Mikael Weiss on 4/7/17.
//  Copyright © 2017 Mikael Weiss. All rights reserved.
//

import UIKit

class RepeatsPicker: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var firstPickerView: UIPickerView!
    @IBOutlet weak var detailLable: UILabel!
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "EditTimesToEdit", sender: UIBarButtonItem())
    }
    @IBAction func RepeatWeeklyPressed(_ sender: UIButton) {
        var senderBool = true
        if senderBool == true {
            sender.backgroundColor = UIColor.blue
            // set the text color
            senderBool = !senderBool
        }
    print("Pressed a repeat button")
    }
    var myArray = ["Hourly", "Daily"]
    var myArray2 = ["1h","2h","3h","4h","5h","6h","7h","8h","9h","10h","11h","12h"]
    var isPickerOpen = false
// MARK: - system stuff
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        firstPickerView.dataSource = self
        firstPickerView.delegate = self
         
    }
// MARK: - table view setup
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0 && indexPath.row == 1) {
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
            switchTheDailyOrHour()
        default:
            print("whats up")
        }
    }
// MARK: - custome functions
    var isDaily = true
    func switchTheDailyOrHour() {
        if isDaily == true {
            detailLable.text = "Daily"
        }else if isDaily == false {
            detailLable.text = "Hourly"
        }
        isDaily = !isDaily
        
    }
}
