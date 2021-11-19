//
//  NormalVC.swift
//  KnightTime 2021
//
//  Created by Dodson, Hayes on 9/13/21.
//

import UIKit


class NormalVC: UIViewController {
    @IBOutlet weak var PeriodA: UILabel!
    @IBOutlet weak var PeriodB: UILabel!
    @IBOutlet weak var PeriodC: UILabel!
    @IBOutlet weak var PeriodCH: UILabel!
    @IBOutlet weak var PeriodD: UILabel!
    @IBOutlet weak var PeriodE: UILabel!
    @IBOutlet weak var PeriodF: UILabel!
    @IBOutlet weak var PeriodG: UILabel!
    @IBOutlet weak var PeriodH: UILabel!
    @IBOutlet weak var cTLabel: UILabel!
    @IBOutlet weak var nCLabel: UILabel!
    @IBOutlet weak var cCLabel: UILabel!
    @IBOutlet weak var timeA: UILabel!
    @IBOutlet weak var timeB: UILabel!
    @IBOutlet weak var timeCH: UILabel!
    @IBOutlet weak var timeC: UILabel!
    @IBOutlet weak var timeD: UILabel!
    @IBOutlet weak var timeE: UILabel!
    @IBOutlet weak var timeF: UILabel!
    @IBOutlet weak var timeG: UILabel!
    @IBOutlet weak var timeH: UILabel!
    @IBOutlet var bgD: UIImageView!
    @IBOutlet var bgL: UIImageView!
    
    func isAppAlreadyLaunchedOnce() -> Bool {
        let defaults = UserDefaults.standard
        if let _ = defaults.string(forKey: "isAppAlreadyLaunchedOnce") {
            print("App already launched")
            return true
        } else {
            defaults.set(true, forKey: "isAppAlreadyLaunchedOnce")
            print("App launched first time")
            return false
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    @IBAction func goToSettings() {
        performSegue(withIdentifier: "segueToSettings", sender: self)
    }
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
        if defaults.bool(forKey: "idarkMode") {
            overrideUserInterfaceStyle = .dark
            bgD.isHidden = false
            bgL.isHidden = true
        }
        else {
            overrideUserInterfaceStyle = .light
            bgD.isHidden = true
            bgL.isHidden = false
        }
        checkday()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if !isAppAlreadyLaunchedOnce() {
            print("Working")
            let p1 = "Period 1"
            let p2 = "Period 2"
            let p3 = "Period 3"
            let p4  = "Period 4"
            let p5A = "Period 5A"
            let p5B = "Period 5B"
            let p6 = "Period 6"
            let p7 = "Period 7"
            defaults.set(p1, forKey: "1111")
            defaults.set(p2, forKey: "2222")
            defaults.set(p3, forKey: "3333")
            defaults.set(p4, forKey: "4444")
            defaults.set(p5A, forKey: "5555A")
            defaults.set(p5B, forKey: "5555B")
            defaults.set(p6, forKey: "6666")
            defaults.set(p7, forKey: "7777")
        }
        if blockDay == "Tuesday" {
            let pd1 = defaults.object(forKey: "1111") as! String
            let pd2 = defaults.object(forKey: "2222") as! String
            let pd3 = defaults.object(forKey: "3333") as! String
            let pd5A = defaults.object(forKey: "5555A") as! String
            let pd5B = defaults.object(forKey: "5555B") as! String
            PeriodA.text = pd2
            PeriodB.text = "Chapel"
            PeriodC.text = pd3
            PeriodCH.text = pd5A
            PeriodD.text = pd5B
            PeriodE.text = pd1
            PeriodF.isHidden = true
            PeriodG.isHidden = true
            PeriodH.isHidden = true
            timeA.text = "8:00 - 9:15"
            timeB.text = "9:25-10:30"
            timeCH.text = "10:40 - 11:55"
            timeC.text = "12:00 - 12:40"
            timeD.text = "12:45 - 1:25"
            timeE.text = "1:30 - 2:45"
            timeF.isHidden = true
            timeG.isHidden = true
            timeH.isHidden = true
        }
        if normalDay {
            let pd1 = defaults.object(forKey: "1111") as! String
            let pd2 = defaults.object(forKey: "2222") as! String
            let pd3 = defaults.object(forKey: "3333") as! String
            let pd4 = defaults.object(forKey: "4444") as! String
            let pd5A = defaults.object(forKey: "5555A") as! String
            let pd5B = defaults.object(forKey: "5555B") as! String
            let pd6 = defaults.object(forKey: "6666") as! String
            let pd7 = defaults.object(forKey: "7777") as! String
            PeriodA.text = pd1
            PeriodB.text = pd2
            PeriodC.text = pd3
            PeriodCH.text = "Chapel"
            PeriodD.text = pd4
            PeriodE.text = pd5A
            PeriodF.text = pd5B
            PeriodG.text = pd6
            PeriodH.text = pd7
            timeA.text = "8:00 - 8:45"
            timeB.text = "8:50 - 9:35"
            timeCH.text = "9:45 - 10:20"
            timeC.text = "10:30 - 11:15"
            timeD.text = "11:20 - 12:05"
            timeE.text = "12:10 - 12:50"
            timeF.text = "12:55 - 1:35"
            timeG.text = "1:40 - 2:25"
            timeH.text = "2:30 - 3:15"
        }
        if blockDay == "Wednesday" {
            let pd7 = defaults.object(forKey: "7777") as! String
            let pd6 = defaults.object(forKey: "6666") as! String
            let pd4 = defaults.object(forKey: "4444") as! String
            let pd5A = defaults.object(forKey: "5555A") as! String
            let pd5B = defaults.object(forKey: "5555B") as! String
            PeriodA.text = pd7
            PeriodB.text = "Chapel"
            PeriodC.text = pd4
            PeriodCH.text = pd5A
            PeriodD.text = pd5B
            PeriodE.text = pd6
            PeriodF.isHidden = true
            PeriodG.isHidden = true
            PeriodH.isHidden = true
            timeA.text = "8:00 - 9:15"
            timeB.text = "9:25-10:30"
            timeCH.text = "10:40 - 11:55"
            timeC.text = "12:00 - 12:40"
            timeD.text = "12:45 - 1:25"
            timeE.text = "1:30 - 2:45"
            timeF.isHidden = true
            timeG.isHidden = true
            timeH.isHidden = true
        }
        
        let jp = Json().parse()
        UIApplication.shared.isIdleTimerDisabled = true
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { _ in
            currentTime = Int(Date().timeIntervalSince(todayDate))
            if defaults.object(forKey: "nc") != nil && defaults.object(forKey: "pc") != nil {
                self.cTLabel.text = jp.remainingLabel()
                jp.cnv(jp.calendar)
                if defaults.object(forKey: "pc") != nil {
                    let pc = defaults.object(forKey: "pc") as! String
                    let nc = defaults.object(forKey: "nc") as! String
                    self.cCLabel.text = "Current Class: " + pc
                    self.nCLabel.text = "Next Class: " + nc
                }else {
                    self.cCLabel.text = "Loading"
                    self.nCLabel.text = "Loading"
                }
            }else {
                self.cCLabel.text = "No More"
                self.nCLabel.text = "Classes"
            }
            self.checkday()
        })
        
        let cc = "Current Class: "
        let nc = "Next Class: "
        defaults.set(cc, forKey: "cClass")
        defaults.set(nc, forKey: "nClass")
        
    }
    func checkday() {
        if blockDay == "Tuesday" {
            let pd1 = defaults.object(forKey: "1111") as! String
            let pd2 = defaults.object(forKey: "2222") as! String
            let pd3 = defaults.object(forKey: "3333") as! String
            let pd5A = defaults.object(forKey: "5555A") as! String
            let pd5B = defaults.object(forKey: "5555B") as! String
            PeriodA.text = pd2
            PeriodB.text = "Chapel"
            PeriodC.text = pd3
            PeriodCH.text = pd5A
            PeriodD.text = pd5B
            PeriodE.text = pd1
            PeriodF.isHidden = true
            PeriodG.isHidden = true
            PeriodH.isHidden = true
            timeA.text = "8:00 - 9:15"
            timeB.text = "9:25-10:30"
            timeCH.text = "10:40 - 11:55"
            timeC.text = "12:00 - 12:40"
            timeD.text = "12:45 - 1:25"
            timeE.text = "1:30 - 2:45"
            timeF.isHidden = true
            timeG.isHidden = true
            timeH.isHidden = true
        }
        if normalDay {
            let pd1 = defaults.object(forKey: "1111") as! String
            let pd2 = defaults.object(forKey: "2222") as! String
            let pd3 = defaults.object(forKey: "3333") as! String
            let pd4 = defaults.object(forKey: "4444") as! String
            let pd5A = defaults.object(forKey: "5555A") as! String
            let pd5B = defaults.object(forKey: "5555B") as! String
            let pd6 = defaults.object(forKey: "6666") as! String
            let pd7 = defaults.object(forKey: "7777") as! String
            PeriodA.text = pd1
            PeriodB.text = pd2
            PeriodC.text = pd3
            PeriodCH.text = "Chapel"
            PeriodD.text = pd4
            PeriodE.text = pd5A
            PeriodF.text = pd5B
            PeriodG.text = pd6
            PeriodH.text = pd7
        }
        if blockDay == "Wednesday" {
            timeA.text = "8:00 - 9:15"
            timeB.text = "9:25-10:30"
            timeCH.text = "10:40 - 11:55"
            timeC.text = "12:00 - 12:40"
            timeD.text = "12:45 - 1:25"
            timeE.text = "1:30 - 2:45"
            timeF.isHidden = true
            timeG.isHidden = true
            timeH.isHidden = true
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        let pd1 = defaults.object(forKey: "1111") as! String
        let pd2 = defaults.object(forKey: "2222") as! String
        let pd3 = defaults.object(forKey: "3333") as! String
        let pd4 = defaults.object(forKey: "4444") as! String
        let pd5A = defaults.object(forKey: "5555A") as! String
        let pd5B = defaults.object(forKey: "5555B") as! String
        let pd6 = defaults.object(forKey: "6666") as! String
        let pd7 = defaults.object(forKey: "7777") as! String
        PeriodA.text = pd1
        PeriodB.text = pd2
        PeriodC.text = pd3
        PeriodCH.text = "Chapel"
        PeriodD.text = pd4
        PeriodE.text = pd5A
        PeriodF.text = pd5B
        PeriodG.text = pd6
        PeriodH.text = pd7
        if defaults.bool(forKey: "idarkMode") {
            overrideUserInterfaceStyle = .dark
            bgD.isHidden = false
            bgL.isHidden = true
        }
        else {
            overrideUserInterfaceStyle = .light
            bgD.isHidden = true
            bgL.isHidden = false
        }
       
    }
    
    func convertTimeShort1(_ time: Int) -> String {
        var hour = Int(time/3600)
        let minutes = Int(time/60%60)
        var hourString = ""
        var minuteString = ""
        
        if hour > 12 { hour = hour - 12}
        if hour >= 10 {hourString = "\(hour):"}
        else { hourString = "  \(hour):"}
        
        if minutes < 10 { minuteString = "0\(minutes)"}
            else { minuteString = "\(minutes)"}
        
        return ("\(hourString)\(minuteString)")
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
    
    func convertTimeShort(_ time: Int) -> String {
        let hour = Int(time/3600)
        let minutes = Int(time/60%60)
        var hourString = ""
        var minuteString = ""
        
        if hour > 12 { hourString = "\(hour - 12):"}
            else { hourString = "\(hour):"}
        if minutes < 10 { minuteString = "0\(minutes)"}
            else { minuteString = "\(minutes)"}
        
        return ("\(hourString)\(minuteString)")
    }
    

}
