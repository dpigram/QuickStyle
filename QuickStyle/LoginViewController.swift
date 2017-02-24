//
//  LoginScreen.swift
//  QuickStyle
//
//  Created by Terell Pigram on 6/27/16.
//  Copyright © 2016 Derell Pigram. All rights reserved.
//

import UIKit
import MMDrawerController

class LoginViewController: UIViewController {

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
                        self.displayStatus(status: true)
                        let appDelegete: AppDelegate = UIApplication.shared.delegate as! AppDelegate
                        UserDefaults.standard.set(true, forKey: "loggedIn")
                        UserDefaults.standard.synchronize();
                        self.present(appDelegete.centerContainer!, animated: true, completion: nil)
                    } else {
                        self.displayStatus(status: false)
                    }
                
                })
            } else {
                DispatchQueue.main.async(execute: {
                    self.displayStatus(status: false)
                })
            }
        }
    }
    
    func displayStatus(status: Bool) -> Void {
        self.successLabel.isHidden = false;
        self.successLabel.textColor = status ? UIColor.green : UIColor.red;
        self.successLabel.text = status ? "Success!" : "Failure"
    }
}
