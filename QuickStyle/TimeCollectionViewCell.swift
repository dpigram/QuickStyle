//
//  TimeCollectionViewCell.swift
//  QuickStyle
//
//  Created by Oyuka Oko on 3/16/17.
//  Copyright © 2017 Derell Pigram. All rights reserved.
//

import UIKit

class TimeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.containerView.layer.cornerRadius = 25
    }

}
