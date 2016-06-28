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
        self.view.backgroundColor = UIColor.blueColor()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.loadData()
        // Do any additional setup after loading the view.
    }

    required init?(coder aDecoder: NSCoder) {
        self.items = []
        super.init(coder: aDecoder)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell

        let currentGroup = self.items[indexPath.row]
        
        cell.textLabel?.text = currentGroup.name
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
