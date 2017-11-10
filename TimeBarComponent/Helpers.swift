//
//  Helpers.swift
//  TimeBarComponent
//
//  Created by PhongLe on 11/8/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import UIKit

class DateHelper {
    
    static func date(from string: String)-> Date{
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy,MM,dd HH:mm"
        return dateFormater.date(from: string)!
    }
    
    static func string(from date: Date)-> String{
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "E HH:mm a"
        return dateFormater.string(from: date)
    }
}
let clock = ["🕐","🕑","🕒","","","","","","","","",""]
