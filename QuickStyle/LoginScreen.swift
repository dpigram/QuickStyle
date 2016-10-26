//
//  LoginScreen.swift
//  QuickStyle
//
//  Created by Terell Pigram on 6/27/16.
//  Copyright © 2016 Derell Pigram. All rights reserved.
//

import UIKit

class LoginScreen: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var successLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInBtnTapped(_ sender: AnyObject) {
        QSUserServices.sharedInstance.requestUserAuthentication(["username": self.username.text!, "password":self.password.text!]) { (data, error) in
            
            if let status: String = data["status"] as? String {
                DispatchQueue.main.async(execute: {
                    if status == "success" {
                        self.successLabel.isHidden = false;
                        self.successLabel.textColor = UIColor.green;
                        self.successLabel.text = "Success!"
                    } else {
                        self.successLabel.isHidden = false;
                        self.successLabel.textColor = UIColor.red;
                        self.successLabel.text = "Failure!"
                    }
                })
            } else {
                DispatchQueue.main.async(execute: {
                    self.successLabel.isHidden = false;
                    self.successLabel.textColor = UIColor.red;
                    self.successLabel.text = "Failure!"
                })
            }
            
        }
    }
}
