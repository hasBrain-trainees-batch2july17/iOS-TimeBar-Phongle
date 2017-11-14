//
//  DataSource.swift
//  TimeBarComponent
//
//  Created by PhongLe on 11/14/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

let minTime = DateHelper.date(from: "2017,11,08 05:00")
let maxTime = DateHelper.date(from: "2017,11,08 11:59")
var schedule: [ChannelModel] = {
    var s = [ChannelModel]()
    
    s.append(ChannelModel(name: "Discovery", program: {
        var programs = [ProgramModel]()
        programs.append(ProgramModel(title: "WHAT ON EARTH?", thumbnail: #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1), start: "2017,11,08 05:05", end: "2017,11,08 06:35"))
        programs.append(ProgramModel(title: "HOW DO THEY DO IT?", thumbnail: #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1), start: "2017,11,08 06:45", end: "2017,11,08 07:50"))
        programs.append(ProgramModel(title: "HOW IT'S MADE (S6)", thumbnail: #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1), start: "2017,11,08 08:00", end: "2017,11,08 10:00"))
        programs.append(ProgramModel(title: "RISE OF THE MACHINES", thumbnail: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), start: "2017,11,08 10:10", end: "2017,11,08 11:00"))
        programs.append(ProgramModel(title: "SUPERCAR SUPERBUILD", thumbnail: #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1), start: "2017,11,08 11:05", end: "2017,11,08 11:25"))
        programs.append(ProgramModel(title: "SURVIVING THE CUT", thumbnail: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1), start: "2017,11,08 11:30", end: "2017,11,08 11:59"))
        return programs
    }() ))
    
    s.append(ChannelModel(name: "Disney", program: {
        var programs = [ProgramModel]()
        programs.append(ProgramModel(title: "LIV & MADDIE", thumbnail: #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1), start: "2017,11,08 5:00", end: "2017,11,08 6:00"))
        programs.append(ProgramModel(title: "MY BABYSITTER'S A VAMPIRE", thumbnail: #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1), start: "2017,11,08 06:05", end: "2017,11,08 08:00"))
        programs.append(ProgramModel(title: "EXTREME BABYSITTING", thumbnail: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), start: "2017,11,08 08:05", end: "2017,11,08 09:30"))
        programs.append(ProgramModel(title: "RIDE", thumbnail: #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1), start: "2017,11,08 09:35", end: "2017,11,08 10:20"))
        programs.append(ProgramModel(title: "MR. YOUNG", thumbnail: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), start: "2017,11,08 10:30", end: "2017,11,08 11:25"))
        programs.append(ProgramModel(title: "STUCK IN THE MIDDLE", thumbnail: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), start: "2017,11,08 11:30", end: "2017,11,08 11:59"))
        return programs
    }() ))
    
    s.append(ChannelModel(name: "Star Plus", program: {
        var programs = [ProgramModel]()
        programs.append(ProgramModel(title: "Meri Durga", thumbnail: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), start: "2017,11,08 6:00", end: "2017,11,08 08:00"))
        programs.append(ProgramModel(title: "Naamkarann", thumbnail: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), start: "2017,11,08 08:05", end: "2017,11,08 09:00"))
        programs.append(ProgramModel(title: "Yeh Rishta Kya Kehlata Hai", thumbnail: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), start: "2017,11,08 08:05", end: "2017,11,08 09:30"))
        programs.append(ProgramModel(title: "Ikyawann", thumbnail: #colorLiteral(red: 0.6687353849, green: 0.4604782462, blue: 0.6216221452, alpha: 1), start: "2017,11,08 09:35", end: "2017,11,08 10:20"))
        programs.append(ProgramModel(title: "Shakti Astitva Ke Ehsaas Ki", thumbnail: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1), start: "2017,11,08 10:30", end: "2017,11,08 11:25"))
        return programs
    }() ))
    
    s.append(ChannelModel(name: "Star Bharat", program: {
        var programs = [ProgramModel]()
        programs.append(ProgramModel(title: "Nimki Mukhiya", thumbnail: #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1), start: "2017,11,08 08:35", end: "2017,11,08 10:00"))
        programs.append(ProgramModel(title: "Kaal Bhairav Rahasya", thumbnail: #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1), start: "2017,11,08 10:05", end: "2017,11,08 10:50"))
        programs.append(ProgramModel(title: "Ayushaman Bhava", thumbnail: #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1), start: "2017,11,08 10:55", end: "2017,11,08 11:25"))
        return programs
    }() ))
    
    s.append(ChannelModel(name: "Star Bharat", program: {
        var programs = [ProgramModel]()
        programs.append(ProgramModel(title: "News", thumbnail: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), start: "2017,11,08 08:35", end: "2017,11,08 10:00"))
        programs.append(ProgramModel(title: "Virundhinar Pakkam", thumbnail: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), start: "2017,11,08 10:05", end: "2017,11,08 10:50"))
        programs.append(ProgramModel(title: "Vinayagar", thumbnail: #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1), start: "2017,11,08 10:55", end: "2017,11,08 11:25"))
        return programs
    }() ))
    s.append(ChannelModel(name: "Star Bharat", program: {
        var programs = [ProgramModel]()
        programs.append(ProgramModel(title: "Tenali Rama", thumbnail: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), start: "2017,11,08 08:30", end: "2017,11,08 09:50"))
        programs.append(ProgramModel(title: "Aadat Se Majboor", thumbnail: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), start: "2017,11,08 10:05", end: "2017,11,08 10:30"))
        return programs
    }() ))
    
    s.append(ChannelModel(name: "SAB", program: {
        var programs = [ProgramModel]()
        programs.append(ProgramModel(title: "Motu Patlu", thumbnail: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), start: "2017,11,08 08:20", end: "2017,11,08 10:00"))
        programs.append(ProgramModel(title: "Motu Patlu", thumbnail: #colorLiteral(red: 0.3774293065, green: 0.2538331151, blue: 0.3494596481, alpha: 1), start: "2017,11,08 10:10", end: "2017,11,08 11:30"))
        return programs
    }() ))
    
    
    return s
}()
