//
//  QSGroup.swift
//  QuickStyle
//
//  Created by Derell Pigram on 6/23/16.
//  Copyright © 2016 Derell Pigram. All rights reserved.
//

import UIKit

class QSGroup: NSObject {
    
/// url used to access information about the group
    var url: URL?
    
/// name of the group
    var name: String?
    
    /**
     initialized class with nil parameters
     
     - returns: an instance of QSGroup
     */
    override init() {
        self.url = nil
        self.name = nil
    }
    
    /**
     initializes class with given values
     
     - parameter url:  url used to acces information abou tthe group
     - parameter name: name of the group
     
     - returns: an instance of QSGroup
     */
    init(url: URL, name: String) {
        self.url = url
        self.name = name
    }
    
}
