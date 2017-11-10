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

let minTime = DateHelper.date(from: "2017,11,08 05:00")
let maxTime = DateHelper.date(from: "2017,11,08 11:59")
var schedule: [ChannelModel] = {
    var s = [ChannelModel]()
    
    s.append(ChannelModel(name: "Discovery", program: {
        var programs = [ProgramModel]()
        programs.append(ProgramModel(title: "WHAT ON EARTH?", thumbnail: #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1), start: "2017,11,08 05:00", end: "2017,11,08 06:35"))
        programs.append(ProgramModel(title: "HOW DO THEY DO IT?", thumbnail: #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1), start: "2017,11,08 06:45", end: "2017,11,08 07:50"))
        programs.append(ProgramModel(title: "HOW IT'S MADE (S6)", thumbnail: #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1), start: "2017,11,08 08:00", end: "2017,11,08 10:00"))
        programs.append(ProgramModel(title: "RISE OF THE MACHINES", thumbnail: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), start: "2017,11,08 10:10", end: "2017,11,08 11:00"))
        programs.append(ProgramModel(title: "SUPERCAR SUPERBUILD", thumbnail: #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1), start: "2017,11,08 11:05", end: "2017,11,08 11:25"))
        programs.append(ProgramModel(title: "SURVIVING THE CUT", thumbnail: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1), start: "2017,11,08 11:30", end: "2017,11,08 11:59"))
        return programs
    }() ))
    
    s.append(ChannelModel(name: "Disney", program: {
        var programs = [ProgramModel]()
        programs.append(ProgramModel(title: "LIV & MADDIE", thumbnail: #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1), start: "2017,11,08 5:00", end: "2017,11,08 6:00"))
        programs.append(ProgramModel(title: "MY BABYSITTER'S A VAMPIRE", thumbnail: #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1), start: "2017,11,08 06:05", end: "2017,11,08 08:00"))
        programs.append(ProgramModel(title: "EXTREME BABYSITTING", thumbnail: #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1), start: "2017,11,08 08:05", end: "2017,11,08 09:30"))
        programs.append(ProgramModel(title: "RIDE", thumbnail: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), start: "2017,11,08 09:35", end: "2017,11,08 10:20"))
        programs.append(ProgramModel(title: "MR. YOUNG", thumbnail: #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1), start: "2017,11,08 10:30", end: "2017,11,08 11:25"))
        programs.append(ProgramModel(title: "STUCK IN THE MIDDLE", thumbnail: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1), start: "2017,11,08 11:30", end: "2017,11,08 11:59"))
        return programs
    }() ))
    
    return s
}()
