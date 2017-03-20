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
    
    @IBOutlet weak var leftNavButton: UIButton!
    
    @IBOutlet weak var gradientView: UIView!
    
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
        self.navigationController?.isNavigationBarHidden = true
        self.configureGradientViewConstriants()
        self.configureGradientView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func leftNavButtonTapped(_ sender: Any) {
        self.appDelegate.drawerController?.toggle(.left, animated: true, completion: nil)
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

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let alertView: UIAlertController = UIAlertController(title: "Book for \(self.arrOfTimes[indexPath.row])?", message: "Your baber will be sent a notification that your appointment is reserved.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertView.addAction(okAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertView.addAction(cancelAction)
        self.present(alertView, animated: true, completion: nil)
        
    }
    
    func configureGradientViewConstriants() {
        let top = NSLayoutConstraint(item: self.gradientView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0)
        let bottom = NSLayoutConstraint(item: self.gradientView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0)
        let left = NSLayoutConstraint(item: self.gradientView, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1.0, constant: 0)
        let right = NSLayoutConstraint(item: self.gradientView, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1.0, constant: 0)
        
        self.view.addConstraints([top, bottom, left, right])
    }
    
    func configureGradientView() -> Void {
        let gradient =  CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: self.view.frame.size.height / 2, width: self.view.frame.size.width, height: self.view.frame.size.height / 2)
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        self.gradientView.layer.insertSublayer(gradient, at: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
}
