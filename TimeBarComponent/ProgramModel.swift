
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

class ProgramMdl {
    var id: String?
    var imageURL: String?
    var channelImageURL: String?
    var title: String?
    var subtitle: String?
    var starttime: Date?
    var endtime: Date?
    init(json: [String: Any]) {
        self.id                 = json["id"] as? String
        self.imageURL           = json["image"] as? String
        self.channelImageURL    = json["channel_image"] as? String
        self.title              = json["title"] as? String
        self.subtitle           = json["subtitle"] as? String
        let currentShowSlot     = json["current_show_slot"] as! [String: Any]
        let from                = currentShowSlot["from"] as! String
        let to                  = currentShowSlot["to"] as! String
        self.starttime          = DateHelper.date(from: from)
        self.endtime            = DateHelper.date(from: to)
    }
}

class TimeDisplay {
    var time: Date?
    var programs = [ProgramMdl]()
    
    init(json:[String: Any]) {
        self.time = DateHelper.date(from: (json["timedisplay"] as! String))
        let items = json["items"] as! [Any]
        for item in items {
            programs.append(ProgramMdl(json: item as! [String: Any]))
        }
    }
    
}

//"id": "01ORANGE",
//"image": "http://192.168.10.172/epg/Orange/RouteduRuhmPosterSquare.jpg",
//"channel_image": "http://192.168.10.172/channellist/Orange/Orange_logo_transparent.png",
//"title": "Road Of Rhum",
//"subtitle": "Sports",
//"starttime": "20:00",
//"endtime": "20:45",
//"current_show_slot": {
//    "from": "2017-09-15T20:00:00Z",
//    "to": "2017-09-15T20:45:00Z"
//}



