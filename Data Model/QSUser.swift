//
//  QSUser.swift
//  QuickStyle
//
//  Created by Derell Pigram on 6/21/16.
//  Copyright © 2016 Derell Pigram. All rights reserved.
//

import UIKit

class QSUser: NSObject {
    
    var userUrl: String = ""
    var userName: String = ""
    var email: String = ""
    var groups: NSArray = []
    
    init(userUrl: String, userName: String, email: String, groups: NSArray) {
        self.userUrl = userUrl
        self.userName = userName
        self.email = email
        self.groups = NSArray(array: groups)
    }
    
    override init() {
        self.userUrl = ""
        self.userName = ""
        self.email = ""
        self.groups = []
    }
}
