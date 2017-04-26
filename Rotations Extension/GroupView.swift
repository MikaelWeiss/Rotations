//
//  GroupView.swift
//  Rotations Prime
//
//  Created by Mikael Weiss on 4/26/17.
//  Copyright © 2017 Mikael Weiss. All rights reserved.
//

import UIKit
import WatchKit

class GroupView: WKInterfaceController {
    @IBOutlet var GroupsTable: WKInterfaceTable!
    
    var groups = [""]
    var index = 1
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
        let theGroups = UserDefaults.standard.object(forKey: "Groups")
        if theGroups != nil {
            groups = theGroups as! [String]
        }else {
            groups = ["No Group", "Go To App!"]
        }
        GroupsTable.setNumberOfRows(groups.count, withRowType: "groupCell")
        while index < groups.count {
            let row = GroupsTable.rowController(at: index) as! groupCell
            row.groupLable.setText(groups[index])
            index += 1
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
}
