//
//  GroupsLookUpViewController.swift
//  QuickStyle
//
//  Created by Derell Pigram on 6/28/16.
//  Copyright © 2016 Derell Pigram. All rights reserved.
//

import UIKit

class QSGroupsLookUpViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var items: Array<QSGroup>
    let userServices: QSUserServices = QSUserServices()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.loadData()
        // Do any additional setup after loading the view.
    }

    required init?(coder aDecoder: NSCoder) {
        self.items = []
        super.init(coder: aDecoder)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell

        let currentGroup = self.items[(indexPath as NSIndexPath).row]
        
        cell.textLabel?.text = currentGroup.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData(){
        self.userServices.requestGroups { (groups, error) -> Void in
            self.items = groups
            self.tableView.reloadData()
        }
    }

}
