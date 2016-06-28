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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}
