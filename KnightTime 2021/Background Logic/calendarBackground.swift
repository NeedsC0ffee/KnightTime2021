//
//  calendarBackground.swift
//  KnightTime 2021
//
//  Created by Dodson, Hayes on 9/30/21.
//

import Foundation
import UIKit
var currentTime = Int(Date().timeIntervalSince(todayDate))

func timeInt(_ time :String) -> Int {
    let timeParts = time.split(separator: ":").map(String.init)
    if timeParts.count > 0 {
        if timeParts.count == 3 {
            return (Int(timeParts[0])! * 3600) + (Int(timeParts[1])! * 60) + (Int(timeParts[2])! * 60)
        }else {
            return (Int(timeParts[0])! * 3600) + (Int(timeParts[1])! * 60)
        }
    }else {
        return 0
    }
}

func convertTime(_ time: Int) -> String {
    let day =     Int(time/86400)
    let hour =    Int(time%86400/3600)
    let minutes = Int(time/60%60)
    let seconds = Int(time%60)
    var hourString =   ""
    var minuteString = ""
    var secondString = ""
    
    if day > 0 { return "\(day) Days"}
    if hour > 0 { hourString = "\(hour):"} else { hourString = "" }
    if minutes < 10 { minuteString = "0\(minutes)"} else { minuteString = "\(minutes)"}
    if seconds < 10 { secondString = ":0\(seconds)"} else { secondString = ":\(seconds)"}
    
    return ("\(hourString)\(minuteString)\(secondString)")
    }

struct Period: Codable {
    var start: Int
    var end: Int
    var name: String
    
    init(_ start: String, _ end: String, _ name: String) {
    self.start = timeInt(start)
    self.end = timeInt(end)
    self.name = name
    }
    
}

struct Day: Codable {
    var title: String
    var schedule: Array<Period>
    var date: Date
    
    init(title: String, schedule: Array<Period>, date: Date) {
        self.title = title
        self.schedule = schedule
        self.date = date
    }
    
    func getPeriodCurrent() -> Period? {
        for period in schedule {
            if (currentTime > period.start) && (currentTime < period.end) {return period}
            }
        return nil
        }
    
    func getPeriodNext() -> Period? {
        for period in schedule {
            if (currentTime < period.start) && (period.name != "Passing") {return period}
            }
        return nil
        }

    
    // Turns the date object of date.type into a generic string for the user
    func dateString() -> String {
        let df = DateFormatter()
        df.dateFormat = "MM-dd-yy"
        return df.string(from: date)
        }
}
struct calendarLogic: Codable {
    var calendar: Day
    
    init(calendar: Day) {
        self.calendar = calendar
    }
    
    func remainingLabel() -> String {
        let jp = Json().parse()
        return convertTime(jp.remainingTime(jp.calendar))
        }
    
    func remainingTime(_ day: Day) -> Int {
        let current = currentTime
        let end = day.getPeriodCurrent()?.end
        let pC = day.getPeriodCurrent()?.name
        let pN = day.getPeriodNext()?.name
        defaults.set(pC, forKey: "pc")
        defaults.set(pN, forKey: "nc")
        if let ed = end {
            let fin = ed - current
            return fin
        }else {
            return(0)
            
        }
    }
    
    func makeBlue(_ day: Day) {
        let n = NormalVC()
        let count = 0
        let periodLables1 = [n.PeriodA.text, n.PeriodB.text, n.PeriodC.text, n.PeriodD.text, n.PeriodE.text, n.PeriodF.text, n.PeriodG.text, n.PeriodH.text]
        if day.getPeriodCurrent()!.name == "" {
            
        }
    }

    func convertTime(_ time: Int) -> String {
        let day =     Int(time/86400)
        let hour =    Int(time%86400/3600)
        let minutes = Int(time/60%60)
        let seconds = Int(time%60)
        var hourString =   ""
        var minuteString = ""
        var secondString = ""
        
        if day > 0 { return "\(day) Days"}
        if hour > 0 { hourString = "\(hour):"} else { hourString = "" }
        if minutes < 10 { minuteString = "0\(minutes)"} else { minuteString = "\(minutes)"}
        if seconds < 10 { secondString = ":0\(seconds)"} else { secondString = ":\(seconds)"}
        
        return ("\(hourString)\(minuteString)\(secondString)")
        }
}

    
    

