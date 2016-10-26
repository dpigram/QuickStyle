//
//  QSDataService.swift
//  QuickStyle
//
//  Created by Derell Pigram on 6/21/16.
//  Copyright © 2016 Derell Pigram. All rights reserved.
//

import UIKit

class QSDataService: NSObject {
    
/// Singleton
    static let sharedInstance = QSDataService()
    
    private let baseUrl = "http://35.160.66.129:8000/"
    private let userName = "dpigram"
    private let password = "flinn123"
    
    typealias QSDictionaryClosure = (_ content: NSDictionary, _ error: Error?) -> Void
    
    /**
     Entry point for all GET requests for records that return dictionaryies
     
     - parameter name:              name of the record to be requested
     - parameter completionHandler: closure that executes after data has come back from server
     */
    func requestDocument(name: String, completionHandler:@escaping QSDictionaryClosure) {
        let request = NSMutableURLRequest(url: NSURL(string: "\(baseUrl)\(name)/")! as URL)
        let session = URLSession.shared
        request.httpMethod = "GET"
        
        let loginString = NSString(format: "%@:%@", userName, password)
        let loginData: NSData = loginString.data(using: String.Encoding.utf8.rawValue)! as NSData
        let base64LoginString = loginData.base64EncodedString(options: [])
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            if data == nil {
                completionHandler([:], error!)
            } else {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! NSDictionary
                    completionHandler(json, nil)
                }catch let error {
                    completionHandler([:], error)
                }
            }
        }
        dataTask.resume()
    }
    
    /**
     Entry point for all post methods
     
     - parameter name:              name of record
     - parameter parameters:        dictionary of parameters required for the specific post
     - parameter completionHandler: QSDictionaryClosure
     */
    func postDocument(name: String, parameters: NSDictionary, completionHandler:@escaping QSDictionaryClosure){
        let request = NSMutableURLRequest(url: NSURL(string: "\(baseUrl)\(name)/")! as URL)
        let session = URLSession.shared
        request.httpMethod = "POST"
        
        let loginString = NSString(format: "%@:%@", userName, password)
        let loginData: NSData = loginString.data(using: String.Encoding.utf8.rawValue)! as NSData
        let base64LoginString = loginData.base64EncodedString(options: [])
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        
        let postString = self.buildPostString(params: parameters)
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            if data == nil {
                completionHandler([:], error!)
            } else {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! NSDictionary
                    completionHandler(json, nil)
                }catch let error {
                    completionHandler([:], error)
                }
            }
        }
        dataTask.resume()
        
    }
    
    func buildPostString(params: NSDictionary) -> String{
        
        var returnString = "";
        var counter = 0;
        for(key,value) in params{
            returnString += (key as! String) + "=" + (value as! String);
            
            if(counter + 1 != params.count){
                returnString += "&";
            }
            counter += 1;
        }
        
        return returnString;
    }
}
