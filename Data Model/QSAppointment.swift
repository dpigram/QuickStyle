//
//  QSAppointment.swift
//  QuickStyle
//
//  Created by Derell Pigram on 6/22/16.
//  Copyright © 2016 Derell Pigram. All rights reserved.
//

import UIKit

class QSAppointment: NSObject {
    var date: Date
    var customer: QSUser
    var style: QSStyle
    var barber: QSUser
    
    override init(){
        self.date = Date()
        self.customer = QSUser()
        self.style = QSStyle()
        self.barber = QSUser()
    }
    
    init(date: Date, customer: QSUser, style: QSStyle, barber:QSUser) {
        self.date = date
        self.customer = customer
        self.style = style
        self.barber = barber
    }
}
