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
    
    /**
     Retrieves all users
     
     - parameter completionHandler: QSDictionaryClosure
     */
    func requestAllUsers(completionHandler:QSDictionaryClosure) {
        dataService.requestDocument("users") { (content, error) -> Void in
            completionHandler(data: content, error: error)
        }
    }
    
    /**
     Retrieves all shop in database
     
     - parameter completionHandler: QSDictionaryClosure
     */
    func requestAllShops(completionHandler:QSDictionaryClosure) {
        dataService.requestDocument("shops") { (content, error) -> Void in
            completionHandler(data: content, error: error)
        }
    }
    
    /**
     Retrives all appointments
     
     - parameter completionHandler: QSDictionaryClosure
     */
    func requestAllAppointments(completionHandler:QSDictionaryClosure) {
        dataService.requestDocument("appointments") { (content, error) -> Void in
            completionHandler(data: content, error: error)
        }
    }
    
    /**
     Retrieves all styles
     
     - parameter completionHandler: QSDictionaryClosure
     */
    func requestAllStyles(completionHandler:QSDictionaryClosure) {
        dataService.requestDocument("styles") { (content, error) -> Void in
            completionHandler(data: content, error: error)
        }
    }
    
    /**
     Retrieves all groups
     
     - parameter completionHandler: QSDictionaryClosure
     */
    func requestGroups(completionHandler:(groups: Array<QSGroup>, error: ErrorType?) -> Void) {
        dataService.requestDocument("groups") { (content, error) -> Void in
            let arrayOfGroups: Array<QSGroup> = self.mapJSONToGroupObjects(content)
            completionHandler(groups: arrayOfGroups, error: error)
        }
    }
    
    /**
     Maps json to an array of QSGroup objects
     
     - parameter content: JSON content
     
     - returns: An array of QSGroupObjects
     */
    func mapJSONToGroupObjects(content: NSDictionary?) -> Array<QSGroup> {
        guard let dict = content where dict.count > 0,
            let results: [[String: String]] = dict["results"] as? Array where results.count > 0 else {
            //no content()
            return []
        }
        
        var allGroups: Array<QSGroup> = Array()
        for group in results {
            allGroups.append(QSGroup(url: NSURL(string: group["url"]!)!, name: group["name"]!))
        }
        
        return allGroups
    }

}



