//
//  QSShops.swift
//  QuickStyle
//
//  Created by Derell Pigram on 6/22/16.
//  Copyright © 2016 Derell Pigram. All rights reserved.
//

import UIKit

class QSShop: NSObject {
    var name: String
    var address: String
    var owner: QSUser
    
    override init() {
        self.name = "";
        self.address = "";
        self.owner = QSUser();
    }
    
    init(name: String, address: String, owner: QSUser) {
        self.name = name;
        self.address = address
        self.owner = owner
    }
}
