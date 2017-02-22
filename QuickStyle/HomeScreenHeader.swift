//
//  HomeScreenHeader.swift
//  QuickStyle
//
//  Created by Derell Pigram on 10/30/16.
//  Copyright © 2016 Derell Pigram. All rights reserved.
//

import UIKit

class HomeScreenHeader: UIView, UICollectionViewDataSource, UICollectionViewDelegate {
    public var data: AnyObject?
    @IBOutlet weak var dateCollectionView: UICollectionView!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    override func awakeFromNib() {
        print("working");
    }
    public func loadData(data: AnyObject?) {
        // update ui
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        
        if(indexPath.row % 2 == 0){
            cell.backgroundColor = UIColor.red
        }
        else{
            cell.backgroundColor = UIColor.blue
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    } 
}
