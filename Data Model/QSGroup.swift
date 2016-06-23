//
//  QSGroup.swift
//  QuickStyle
//
//  Created by Derell Pigram on 6/23/16.
//  Copyright © 2016 Derell Pigram. All rights reserved.
//

import UIKit

class QSGroup: NSObject {
    var count: NSInteger
    
    typealias QSResultClosure = (data: NSArray, error: ErrorType) -> Void
    
    override init() {
        self.count = 0
    }
    
    init(count: NSInteger) {
        self.count = count
    }
    
    
    /**
     Requests the next X number of users
     
     - parameter completion: carries data from request to reciever
     */
    func requestNextUsers(completion:QSResultClosure){
        
    }
    
    /**
     Request the previous X number of users
     
     - parameter completion: carries data from request to reciever
     */
    func requestPrevious(completion:QSResultClosure){
        
    }
}
