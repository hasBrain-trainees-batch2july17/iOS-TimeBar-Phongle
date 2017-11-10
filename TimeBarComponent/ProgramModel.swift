
//
//  ProgramModel.swift
//  TimeBarComponent
//
//  Created by PhongLe on 11/8/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import UIKit

class ProgramModel {
    var title: String?
    var thumbnail: UIColor?
    var timeStart: Date?
    var timeEnd: Date?
    
    init(title: String, thumbnail: UIColor, start: String, end: String) {
        self.title = title
        self.thumbnail = thumbnail
        self.timeStart = DateHelper.date(from: start)
        self.timeEnd = DateHelper.date(from: end)
    }
}




