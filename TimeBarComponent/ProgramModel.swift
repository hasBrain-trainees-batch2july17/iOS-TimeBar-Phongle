
//
//  ProgramModel.swift
//  TimeBarComponent
//
//  Created by PhongLe on 11/8/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import UIKit

class ProgramModel {
    var title: String
    var thumbnailColor: UIColor
    var thumbnailLink: String
    var thumbnailImage: UIImage?
    var timeStart: Date
    var timeEnd: Date
    
    init(title: String, thumbnailColor: UIColor, thumbnailLink: String, start: String, end: String) {
        self.title = title
        self.thumbnailColor = thumbnailColor
        self.thumbnailLink = thumbnailLink
        self.timeStart = DateHelper.date(from: start)
        self.timeEnd = DateHelper.date(from: end)
    }
}




