//
//  QSStyle.swift
//  QuickStyle
//
//  Created by Derell Pigram on 6/22/16.
//  Copyright © 2016 Derell Pigram. All rights reserved.
//

import UIKit

class QSStyle: NSObject {
    var name: String
    
    override init() {
        name = ""
    }
    
    init(name: String) {
        self.name = name
    }
}
