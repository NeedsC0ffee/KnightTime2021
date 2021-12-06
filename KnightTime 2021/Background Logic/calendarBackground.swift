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
        let jp = Json().get()
        return convertTime(jp.remainingTime(jp.calendar))
        }
    
    func remainingTime(_ day: Day) -> Int {
        let current = currentTime
        weekday = f.weekdaySymbols[Calendar.current.component(.weekday, from: Date()) - 1]
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
    func cnv(_ day: Day) {
        let pc = day.getPeriodCurrent()?.name
        if pc == "Period 1" {defaults.set(defaults.object(forKey: "1111") as! String, forKey: "pc")}
        if pc == "Period 2" {defaults.set(defaults.object(forKey: "2222") as! String, forKey: "pc")}
        if pc == "Period 3" {defaults.set(defaults.object(forKey: "3333") as! String, forKey: "pc")}
        if pc == "Period 4" {defaults.set(defaults.object(forKey: "4444") as! String, forKey: "pc")}
        if pc == "Period 5A" {defaults.set(defaults.object(forKey: "5555A") as! String, forKey: "pc")}
        if pc == "Period 5B" {defaults.set(defaults.object(forKey: "5555B") as! String, forKey: "pc")}
        if pc == "Period 6" {defaults.set(defaults.object(forKey: "6666") as! String, forKey: "pc")}
        if pc == "Period 7" {defaults.set(defaults.object(forKey: "7777") as! String, forKey: "pc")}
        let nc = day.getPeriodNext()?.name
        if nc == "Period 1" {defaults.set(defaults.object(forKey: "1111") as! String, forKey: "nc")}
        if nc == "Period 2" {defaults.set(defaults.object(forKey: "2222") as! String, forKey: "nc")}
        if nc == "Period 3" {defaults.set(defaults.object(forKey: "3333") as! String, forKey: "nc")}
        if nc == "Period 4" {defaults.set(defaults.object(forKey: "4444") as! String, forKey: "nc")}
        if nc == "Period 5A" {defaults.set(defaults.object(forKey: "5555A") as! String, forKey: "nc")}
        if nc == "Period 5B" {defaults.set(defaults.object(forKey: "5555B") as! String, forKey: "nc")}
        if nc == "Period 6" {defaults.set(defaults.object(forKey: "6666") as! String, forKey: "nc")}
        if nc == "Period 7" {defaults.set(defaults.object(forKey: "7777") as! String, forKey: "nc")}
    }
    
    func makeBlue(_ day: Day) {
        let n = NormalVC()
        if n.PeriodA != nil{
            if weekday == "Monday" || weekday == "Thursday" || weekday == "Friday" {
                if calendar.getPeriodCurrent()?.name == "Period 1" {
                    n.PeriodA.textColor = .blue
                    n.timeA.textColor = .blue
                }
                if calendar.getPeriodCurrent()?.name == "Period 2" {
                    n.PeriodB.textColor = .blue
                    n.timeB.textColor = .blue
                }
                if calendar.getPeriodCurrent()?.name == "Chapel" {
                    n.PeriodCH.textColor = .blue
                    n.timeCH.textColor = .blue
                }
                if calendar.getPeriodCurrent()?.name == "Period 3" {
                    n.PeriodC.textColor = .blue
                    n.timeC.textColor = .blue
                }
                if calendar.getPeriodCurrent()?.name == "Period 4" {
                    n.PeriodD.textColor = .blue
                    n.timeD.textColor = .blue
                }
                if calendar.getPeriodCurrent()?.name == "Period 5A" {
                    n.PeriodE.textColor = .blue
                    n.timeE.textColor = .blue
                }
                if calendar.getPeriodCurrent()?.name == "Period 5B" {
                    n.PeriodF.textColor = .blue
                    n.timeF.textColor = .blue
                }
                if calendar.getPeriodCurrent()?.name == "Period 6" {
                    n.PeriodG.textColor = .blue
                    n.timeG.textColor = .blue
                }
                if calendar.getPeriodCurrent()?.name == "Period 7" {
                    n.PeriodH.textColor = .blue
                    n.timeH.textColor = .blue
                }
            }
            if weekday == "Tuesday" {
                if calendar.getPeriodCurrent()?.name == "Period 1" {
                    n.PeriodA.textColor = .blue
                    n.timeA.textColor = .blue
                }
                if calendar.getPeriodCurrent()?.name == "Period 2" {
                    n.PeriodB.textColor = .blue
                    n.timeB.textColor = .blue
                }
                if calendar.getPeriodCurrent()?.name == "Chapel" {
                    n.PeriodCH.textColor = .blue
                    n.timeCH.textColor = .blue
                }
                if calendar.getPeriodCurrent()?.name == "Period 3" {
                    n.PeriodC.textColor = .blue
                    n.timeC.textColor = .blue
                }
                if calendar.getPeriodCurrent()?.name == "Period 5A" {
                    n.PeriodE.textColor = .blue
                    n.timeE.textColor = .blue
                }
                if calendar.getPeriodCurrent()?.name == "Period 5B" {
                    n.PeriodF.textColor = .blue
                    n.timeF.textColor = .blue
                }
            }
            if weekday == "Wednesday" {
                if calendar.getPeriodCurrent()?.name == "Period 5A" {
                    n.PeriodE.textColor = .blue
                    n.timeE.textColor = .blue
                }
                if calendar.getPeriodCurrent()?.name == "Period 5B" {
                    n.PeriodF.textColor = .blue
                    n.timeF.textColor = .blue
                }
                if calendar.getPeriodCurrent()?.name == "Period 6" {
                    n.PeriodG.textColor = .blue
                    n.timeG.textColor = .blue
                }
                if calendar.getPeriodCurrent()?.name == "Period 7" {
                    n.PeriodH.textColor = .blue
                    n.timeH.textColor = .blue
                }
                if calendar.getPeriodCurrent()?.name == "Period 4" {
                    n.PeriodD.textColor = .blue
                    n.timeD.textColor = .blue
                }
            }
            
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

