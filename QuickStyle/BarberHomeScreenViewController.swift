//
//  BarberHomeScreenViewController.swift
//  QuickStyle
//
//  Created by Oyuka Oko on 3/11/17.
//  Copyright © 2017 Derell Pigram. All rights reserved.
//

import UIKit

class BarberHomeScreenViewController: UIViewController {

    @IBOutlet weak var leftNavButton: UIBarButtonItem!
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func leftNavButtonTapped(_ sender: Any) {
        self.appDelegate.drawerController?.open(.left, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
