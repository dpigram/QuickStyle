//
//  HomeScreenViewController.swift
//  QuickStyle
//
//  Created by Derell Pigram on 10/30/16.
//  Copyright © 2016 Derell Pigram. All rights reserved.
//

import UIKit
import MMDrawerController
class HomeScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var leftNavButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tableHeaderView: HomeScreenHeader = headerFromNib()
        tableHeaderView.frame = CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: tableHeaderView.frame.size.height)
        tableHeaderView.backgroundColor = UIColor.blue
        tableHeaderView.loadData(data: nil)
        tableView.tableHeaderView = tableHeaderView
        tableView.register(UINib(nibName: "BarberDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "BarberDetailTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self

        
        NotificationCenter.default.addObserver(self, selector: #selector(showloginScreen), name: NSNotification.Name(rawValue: "QSAuthenticationChanged"), object: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.showloginScreen();
    }
    
    func showloginScreen(){
        if !UserDefaults.standard.bool(forKey: "loggedIn") {
            self.navigationController?.dismiss(animated: true, completion: nil)
        }
    }
    
    func headerFromNib() -> HomeScreenHeader {
        return UINib(nibName: "HomeScreenHeader", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! HomeScreenHeader
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BarberDetailTableViewCell", for: indexPath) as! BarberDetailTableViewCell
        
        if indexPath.row % 2 != 0 {
            cell.backgroundColor = UIColor.init(white: 0.8, alpha: 0.5)
        } else {
            cell.backgroundColor = UIColor.init(white: 1.0, alpha: 1)
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 112
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func leftNavButtonTapped(_ sender: Any) {
        let appDelegete: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appDelegete.centerContainer?.toggle(.left, animated: true, completion: nil);
    }
    
    
}
