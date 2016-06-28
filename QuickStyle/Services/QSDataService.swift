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
    
    private let baseUrl = "http://127.0.0.1:8000/"
    private let userName = "tpigram"
    private let password = "Onmyway2thetop"
    
    typealias QSDictionaryClosure = (content: NSDictionary, error: ErrorType?) -> Void
    
    /**
     Entry point for all GET requests for records that return dictionaryies
     
     - parameter name:              name of the record to be requested
     - parameter completionHandler: closure that executes after data has come back from server
     */
    func requestDocument(name: String, completionHandler:QSDictionaryClosure) {
        let request = NSMutableURLRequest(URL: NSURL(string: "\(baseUrl)\(name)/")!)
        let session = NSURLSession.sharedSession()
        request.HTTPMethod = "GET"
        
        let loginString = NSString(format: "%@:%@", userName, password)
        let loginData: NSData = loginString.dataUsingEncoding(NSUTF8StringEncoding)!
        let base64LoginString = loginData.base64EncodedStringWithOptions([])
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        
        let dataTask = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            if data == nil {
                completionHandler(content: [:], error: error!)
            } else {
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! NSDictionary
                    completionHandler(content: json, error: nil)
                }catch let error {
                    completionHandler(content: [:], error: error)
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
    func postDocument(name: String, parameters: NSDictionary, completionHandler:QSDictionaryClosure){
        let request = NSMutableURLRequest(URL: NSURL(string: "\(baseUrl)\(name)/")!)
        let session = NSURLSession.sharedSession()
        request.HTTPMethod = "POST"
        
        let loginString = NSString(format: "%@:%@", userName, password)
        let loginData: NSData = loginString.dataUsingEncoding(NSUTF8StringEncoding)!
        let base64LoginString = loginData.base64EncodedStringWithOptions([])
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        
        let postString = self.buildPostString(parameters)
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding);
        
        let dataTask = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            if data == nil {
                completionHandler(content: [:], error: error!)
            } else {
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! NSDictionary
                    completionHandler(content: json, error: nil)
                }catch let error {
                    completionHandler(content: [:], error: error)
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
