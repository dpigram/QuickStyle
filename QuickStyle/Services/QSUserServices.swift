//
//  QSUserServices.swift
//  QuickStyle
//
//  Created by Derell Pigram on 6/19/16.
//  Copyright © 2016 Derell Pigram. All rights reserved.
//

import UIKit

class QSUserServices: NSObject {
    static let sharedInstance = QSUserServices()
    
    private let dataService = QSDataService.sharedInstance
    
    typealias QSDictionaryClosure = (data: AnyObject, error: ErrorType?) -> Void
    
    func requestAllUsers(completionHandler:QSDictionaryClosure) {
        dataService.requestDocument("users") { (content, error) -> Void in
            completionHandler(data: content, error: error)
        }
    }
    
    func requestAllGroups(completionHandler:QSDictionaryClosure) {
        dataService.requestDocument("groups") { (content, error) -> Void in
            completionHandler(data: content, error: error)
        }
    }
    
    func requestAllShops(completionHandler:QSDictionaryClosure) {
        dataService.requestDocument("shops") { (content, error) -> Void in
            completionHandler(data: content, error: error)
        }
    }
    
    func requestAllAppointments(completionHandler:QSDictionaryClosure) {
        dataService.requestDocument("appointments") { (content, error) -> Void in
            completionHandler(data: content, error: error)
        }
    }
    
    func requestAllStyles(completionHandler:QSDictionaryClosure) {
        dataService.requestDocument("styles") { (content, error) -> Void in
            completionHandler(data: content, error: error)
        }
    }
}



