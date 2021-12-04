//
//  Background.swift
//  KnightTime 2021
//
//  Created by Dodson, Hayes on 9/16/21.
//

import Foundation
import UIKit

let defaults = UserDefaults.standard
let date = Date()
let calendar = Calendar.current
let hour = calendar.component(.hour, from: date)
let minutes = calendar.component(.minute, from: date)
let seconds = calendar.component(.second, from: date)
var todayDate = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month, .day], from: Date()))!
var today = Calendar.current.date(from: Calendar.current.dateComponents([.day], from: Date()))
var currentTimeString = String(hour) + ":" + String(minutes) + ":" + String(seconds)
var currentTimeStringShort = String(hour) + ":" + String(minutes)
let N = NormalVC()
let S = nSVC()
let f = DateFormatter()
var weekday = f.weekdaySymbols[Calendar.current.component(.weekday, from: Date()) - 1]
var blockDay = ""
var normalDay = false

struct Json {
    func get() -> calendarLogic{
        let tuesday = Day(title: "Tuesday", schedule: [Period("7:30","8:00","Start"),Period("8:00","9:15","Period 2"),Period("9:15","9:25","Passing"),Period("9:25","10:30","Chapel"),Period("10:30","10:40","Passing"),Period("10:40","11:55","Period 3"),Period("11:55","12:00","Passing"),Period("12:00","12:40","Period 5A"),Period("12:40","12:45","Passing"),Period("12:45","13:25","Period 5B"),Period("13:25","13:30","Passing"),Period("13:30","14:45","Period 1"), Period("14:45","20:00","end")], date: todayDate)
        let wednesday = Day(title: "Wednesday", schedule: [Period("7:30","8:00","Start"),Period("8:00","9:15","Period 7"),Period("9:15","9:25","Passing"),Period("9:25","10:30","Chapel"),Period("10:30","10:40","Passing"),Period("10:40","11:55","Period 4"),Period("11:55","12:00","Passing"),Period("12:00","12:40","Period 5A"),Period("12:40","12:45","Passing"),Period("12:45","13:25","Period 5B"),Period("13:25","13:30","Passing"),Period("13:30","14:45","Period 6"), Period("14:45","24:00","end")], date: todayDate)
        let thursday = Day(title: "Thursday", schedule: [Period("7:30","8:00","Start"),Period("8:00","8:45","Period 1"),Period("8:45","8:50","Passing"),Period("8:50","9:35","Period 2"),Period("9:35","9:45","Passing"),Period("9:45","10:20","Chapel"),Period("10:20","10:30","Passing"),Period("10:30","11:15","Period 3"),Period("11:15","11:20","Passing"),Period("11:20","12:05","Period 4"),Period("12:05","12:10","Passing"),Period("12:10","12:50","Period 5A"),Period("12:50","12:55","Passing"),Period("12:55","13:35","Period 5B"),Period("13:35","13:40","Passing"),Period("13:40","14:25","Period 6"),Period("14:25","14:30","Passing"),Period("14:30","15:15","Period 7"), Period("15:15","24:00","end")], date: todayDate)
        let weekend = Day(title: "weekday", schedule: [Period("0:00","12:00","Weekend"), Period("12:00","0:00","No School")], date: todayDate)
        let friday = Day(title: "Friday", schedule: [Period("7:30","8:00","Start"),Period("8:00","8:45","Period 1"),Period("8:45","8:50","Passing"),Period("8:50","9:35","Period 2"),Period("9:35","9:45","Passing"),Period("9:45","10:20","Chapel"),Period("10:20","10:30","Passing"),Period("10:30","11:15","Period 3"),Period("11:15","11:20","Passing"),Period("11:20","12:05","Period 4"),Period("12:05","12:10","Passing"),Period("12:10","12:50","Period 5A"),Period("12:50","12:55","Passing"),Period("12:55","13:35","Period 5B"),Period("13:35","13:40","Passing"),Period("13:40","14:25","Period 6"),Period("14:25","14:30","Passing"),Period("14:30","15:15","Period 7"), Period("15:15","24:00","end")], date: todayDate)
        let monday = Day(title: "Monday", schedule: [Period("7:30","8:00","Start"),Period("8:00","8:45","Period 1"),Period("8:45","8:50","Passing"),Period("8:50","9:35","Period 2"),Period("9:35","9:45","Passing"),Period("9:45","10:20","Chapel"),Period("10:20","10:30","Passing"),Period("10:30","11:15","Period 3"),Period("11:15","11:20","Passing"),Period("11:20","12:05","Period 4"),Period("12:05","12:10","Passing"),Period("12:10","12:50","Period 5A"),Period("12:50","12:55","Passing"),Period("12:55","13:35","Period 5B"),Period("13:35","13:40","Passing"),Period("13:40","14:25","Period 6"),Period("14:25","14:30","Passing"),Period("14:30","15:15","Period 7"), Period("15:15","24:00","end")], date: todayDate)
        if "Tuesday" == weekday {
            defaults.set(tuesday.title, forKey: "day")
            return calendarLogic(calendar: tuesday)
        }
        if "Wednesday" == weekday {
            defaults.set(wednesday.title, forKey: "day")
            return calendarLogic(calendar: wednesday)
        }
        if "Thursday" == weekday {
            defaults.set(thursday.title, forKey: "day")
            return calendarLogic(calendar: thursday)
        }
        if "Friday" == weekday {
            defaults.set(friday.title, forKey: "day")
            return calendarLogic(calendar: friday)
        }
        if "Monday" == weekday {
            defaults.set(monday.title, forKey: "day")
            return calendarLogic(calendar: monday)
        }
        return calendarLogic(calendar: weekend)
    }
}


/*
 Day(title: newScheduleName, schedule:[Period("","",""),Period("","","Passing"),Period("","",""),Period(“”,””,”Passing”),Period("","",""),Period(“”,””,”Passing”),Period("","",""),Period(“”,””,”Passing”),Period(“”,””,””),Period(“”,””,”Passing”),Period("","",""),Period(“”,””,”Passing”),Period("","",""),Period(“”,””,”end”),])
 */
