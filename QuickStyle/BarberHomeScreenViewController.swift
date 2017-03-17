//
//  BarberHomeScreenViewController.swift
//  QuickStyle
//
//  Created by Oyuka Oko on 3/11/17.
//  Copyright © 2017 Derell Pigram. All rights reserved.
//

import UIKit

class BarberHomeScreenViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var timeCollectionView: UICollectionView!
    @IBOutlet weak var leftNavButton: UIBarButtonItem!
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var arrOfTimes: [String] = ["7:00 am", "8:00 am", "9:00 am", "10:00am", "11:00 am", "7:00 am", "7:00 am", "7:00 am", "7:00 am"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        self.timeCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        self.timeCollectionView.register(UINib(nibName: "TimeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TimeCollectionViewCell")
        self.timeCollectionView.delegate = self
        self.timeCollectionView.dataSource = self
        self.timeCollectionView.contentInset = UIEdgeInsets(top: -20, left: 0, bottom: 0, right: 0)
        self.timeCollectionView.backgroundColor = UIColor.clear
        self.automaticallyAdjustsScrollViewInsets = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func leftNavButtonTapped(_ sender: Any) {
        self.appDelegate.drawerController?.open(.left, animated: true, completion: nil)
    }
    
    //UICollectionView Delegate Methods
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TimeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TimeCollectionViewCell", for: indexPath) as! TimeCollectionViewCell
        cell.timeLabel.text = self.arrOfTimes[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrOfTimes.count
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
}
