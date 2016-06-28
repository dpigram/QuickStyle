//
//  ViewController.swift
//  QuickStyle
//
//  Created by Derell Pigram on 6/18/16.
//  Copyright © 2016 Derell Pigram. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let us: QSUserServices = QSUserServices()
        
        us.requestGroups { (groups, error) -> Void in
            print(groups)
        }
        QSUserServices.sharedInstance.requestAllShops { (data, error) in
            print(data)
        }
        
        QSUserServices.sharedInstance.requestAllUsers { (data, error) in
            print(data)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

