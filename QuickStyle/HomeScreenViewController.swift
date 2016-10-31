//
//  HomeScreenViewController.swift
//  QuickStyle
//
//  Created by Derell Pigram on 10/30/16.
//  Copyright © 2016 Derell Pigram. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
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
        
    }
    
    func headerFromNib() -> HomeScreenHeader {
        return UINib(nibName: "HomeScreenHeader", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! HomeScreenHeader
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BarberDetailTableViewCell", for: indexPath) as! BarberDetailTableViewCell

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 112
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
