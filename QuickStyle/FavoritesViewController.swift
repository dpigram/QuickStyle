//
//  FavoritesViewController.swift
//  QuickStyle
//
//  Created by Terell Pigram on 1/2/17.
//  Copyright © 2017 Derell Pigram. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Favorites"
        self.view.backgroundColor = .lightGray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func LogoutButtonTapped(_ sender: Any) {
        // setting loggedIn flag
        UserDefaults.standard.set(false, forKey: "loggedIn");
        UserDefaults.standard.synchronize()
        NotificationCenter.default.post(name: NSNotification.Name("QSAuthenticationChanged"), object: nil);
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.centerContainer?.toggle(.left, animated: true, completion: nil);
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Barbers"
        case 1:
            return "Shops"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell();
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = "Barber \(indexPath.row)"
        default:
            cell.textLabel?.text = "Shop \(indexPath.row)"
        }
        
        return cell
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
