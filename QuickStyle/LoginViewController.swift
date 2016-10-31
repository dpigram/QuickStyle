//
//  LoginScreen.swift
//  QuickStyle
//
//  Created by Terell Pigram on 6/27/16.
//  Copyright © 2016 Derell Pigram. All rights reserved.
//

import UIKit

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
                        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let homeScreen: HomeScreenViewController = storyboard.instantiateViewController(withIdentifier: "HomeScreen") as! HomeScreenViewController
                        let navController: UINavigationController = UINavigationController(rootViewController: homeScreen)
                        navController.hidesBarsOnSwipe = true
                        self.present(navController, animated: true, completion: nil) 
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
        self.successLabel.isHidden = !status;
        self.successLabel.textColor = status ? UIColor.green : UIColor.red;
        self.successLabel.text = status ? "Success!" : "Failure"
    }
}
