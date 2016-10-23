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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func signInBtnTapped(_ sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let lookUpVC = storyboard.instantiateViewController(withIdentifier: "QSGroupsLookUpViewController")
        present(lookUpVC, animated: true, completion: nil)
        
//        QSUserServices.sharedInstance.requestUserAuthentication(["username": self.username.text!, "password":self.password.text!]) { (data, error) in
//            print(data);
//        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
