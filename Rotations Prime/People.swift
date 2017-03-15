//
//  People.swift
//  Rotations Prime
//
//  Created by Mikael Weiss on 3/9/17.
//  Copyright © 2017 Mikael Weiss. All rights reserved.
//

import Foundation

class People {
    private var _personName: String
    
    var personName: String {
        return _personName
    }
    
    init(personName: String) {
        _personName = personName
    }
}
