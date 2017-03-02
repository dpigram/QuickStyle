//
//  HomeScreenHeader.swift
//  QuickStyle
//
//  Created by Derell Pigram on 10/30/16.
//  Copyright © 2016 Derell Pigram. All rights reserved.
//

import UIKit

class HomeScreenHeader: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    public var data: AnyObject?
    @IBOutlet weak var dateCollectionView: UICollectionView!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    override func awakeFromNib() {
        self.dateCollectionView.register(UINib.init(nibName: "HomeScreenHeaderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeScreenHeaderCollectionViewCell")
        self.leftButton.setTitle("left", for: .normal)
        self.rightButton.setTitle("right", for: .normal)
        self.leftButton.isHidden = true
    }
    public func loadData(data: AnyObject?) {
        // update ui
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeScreenHeaderCollectionViewCell", for: indexPath) as! HomeScreenHeaderCollectionViewCell
        
        cell.dayNumberLbl.text = "23"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)

    }
    
    @IBAction func letfBtnTapped(_ sender: Any) {
        let visibleItems = self.dateCollectionView.indexPathsForVisibleItems
        let currentItem = visibleItems[0]
        if(currentItem.item != 0){
            
            let nextItem = NSIndexPath(item:currentItem.item - 1, section: currentItem.section)
            self.dateCollectionView.scrollToItem(at: nextItem as IndexPath, at: .centeredHorizontally, animated: true)
            self.showOrHideButtonsDirectionButtons(indexPath: nextItem)
        }
        
        
        
    }
    
    func showOrHideButtonsDirectionButtons(indexPath: NSIndexPath){
        self.leftButton.isHidden = (indexPath.item == 0) ? true : false
        self.rightButton.isHidden = (indexPath.item + 1 == self.dateCollectionView.numberOfItems(inSection: 0)) ? true : false
    }
    
    @IBAction func rightBtnTapped(_ sender: Any) {
        
        let visibleItems = self.dateCollectionView.indexPathsForVisibleItems
        let currentItem = visibleItems[0]
        if(self.dateCollectionView.numberOfItems(inSection: 0) > currentItem.item + 1){
            let nextItem = NSIndexPath(item:currentItem.item + 1, section: currentItem.section)
            self.dateCollectionView.scrollToItem(at: nextItem as IndexPath, at: .centeredHorizontally, animated: true)
            self.showOrHideButtonsDirectionButtons(indexPath: nextItem)
        }
        
    }
    
}
