//
//  ChannelModel.swift
//  TimeBarComponent
//
//  Created by PhongLe on 11/8/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import UIKit
class ChannelModel {
    var name: String?
    var programs = [ProgramModel]()
    init(name: String, program: [ProgramModel]) {
        self.name = name
        self.programs = program
    }
    
    func getProgram(at time: Date)->ProgramModel?{
        for item in programs {
            if (item.timeStart?.compare(lessThan: time))! && (item.timeEnd?.compare(greaterThan: time))! {
                return item
            }
        }
        return nil
    }
}

extension Date {
    func compare(lessThan date: Date)->Bool{
        return Calendar.current.compare(self, to: date, toGranularity: .minute).rawValue == -1 ? true : false
    }
    func compare(greaterThan date: Date)->Bool{
        return Calendar.current.compare(self, to: date, toGranularity: .minute).rawValue == 1 ? true : false
    }
    func compare(equal date: Date)->Bool{
        return Calendar.current.compare(self, to: date, toGranularity: .minute).rawValue == 0 ? true : false
    }
}


