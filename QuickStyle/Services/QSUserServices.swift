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
    
    fileprivate let dataService = QSDataService.sharedInstance
    
    typealias QSDictionaryClosure = (_ data: AnyObject, _ error: Error?) -> Void
    
    /**
     Retrieves all users
     
     - parameter completionHandler: QSDictionaryClosure
     */
    func requestAllUsers(_ completionHandler:@escaping QSDictionaryClosure) {
        dataService.requestDocument(name: "users") { (content, error) -> Void in
            DispatchQueue.main.async(execute: { () -> Void in
                completionHandler(content,
                                  error)
            })
        }
    }
    
    /**
     Retrieves all shop in database
     
     - parameter completionHandler: QSDictionaryClosure
     */
    func requestAllShops(_ completionHandler:@escaping QSDictionaryClosure) {
        dataService.requestDocument(name: "shops") { (content, error) -> Void in
            DispatchQueue.main.async(execute: { () -> Void in
                completionHandler(content, error)
            })
        }
    }
    
    /**
     Retrives all appointments
     
     - parameter completionHandler: QSDictionaryClosure
     */
    func requestAllAppointments(_ completionHandler:@escaping QSDictionaryClosure) {
        dataService.requestDocument(name: "appointments") { (content, error) -> Void in
            DispatchQueue.main.async(execute: { () -> Void in
                completionHandler(content, error)
            })
        }
    }
    
    /**
     Retrieves all styles
     
     - parameter completionHandler: QSDictionaryClosure
     */
    func requestAllStyles(_ completionHandler:@escaping QSDictionaryClosure) {
        dataService.requestDocument(name: "styles") { (content, error) -> Void in
            DispatchQueue.main.async(execute: { () -> Void in
                completionHandler(content, error)
            })
            
        }
    }
    
    /**
     Retrieves all groups
     
     - parameter completionHandler: QSDictionaryClosure
     */
    func requestGroups(_ completionHandler:@escaping (_ groups: Array<QSGroup>, _ error: Error?) -> Void) {
        dataService.requestDocument(name: "groups") { (content, error) -> Void in
            let arrayOfGroups: Array<QSGroup> = self.mapJSONToGroupObjects(content)
            DispatchQueue.main.async(execute: { () -> Void in
                completionHandler(arrayOfGroups, error)
            })
        }
    }
    
    /**
     Maps json to an array of QSGroup objects
     
     - parameter content: JSON content
     
     - returns: An array of QSGroupObjects
     */
    fileprivate func mapJSONToGroupObjects(_ content: NSDictionary?) -> Array<QSGroup> {
        // Is the content nil or are there any elements in the results array?
        guard let dict = content, dict.count > 0,
            let results: [[String: String]] = dict["results"] as? Array, results.count > 0 else {
            //We don't have anything, so lets just return an empty array
            return []
        }
        
        //We have data
        var allGroups: Array<QSGroup> = Array()
        
        //Let's loop through and map the json object in to objects for the consuming application
        for group in results {
            allGroups.append(QSGroup(url: URL(string: group["url"]!)!, name: group["name"]!))
        }
        
        //all done
        return allGroups
    }

    /**
     Authenticates the user based on the credentials passed into the dictionary
     
     - parameter parameters:        dictionary that contains the user's credentials
     - parameter completionHandler: executed among completion of the user authentication
     */
    func requestUserAuthentication(_ parameters: NSDictionary, completionHandler:@escaping QSDictionaryClosure){
        dataService.postDocument(name: "user/auth", parameters: parameters) { (content, error) in
            completionHandler(content, error)
        }
    }

}



