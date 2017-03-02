//
//  HomeScreenHeaderCollectionViewCell.swift
//  QuickStyle
//
//  Created by Terell Pigram on 2/21/17.
//  Copyright © 2017 Derell Pigram. All rights reserved.
//

import UIKit

class HomeScreenHeaderCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var dayNumberLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.dayNumberLbl.text = "testing"
    }

}
