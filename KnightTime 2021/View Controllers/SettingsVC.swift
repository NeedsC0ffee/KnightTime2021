//
//  SettingsVC.swift
//  KnightTime 2021
//
//  Created by Dodson, Hayes on 9/15/21.
//

import UIKit
import Foundation


class SettingsVC: UITableViewController {
    @IBOutlet var f1:UITextField!
    @IBOutlet weak var f2:UITextField!
    @IBOutlet weak var f3:UITextField!
    @IBOutlet weak var f4:UITextField!
    @IBOutlet weak var f5A:UITextField!
    @IBOutlet weak var f5B:UITextField!
    @IBOutlet weak var f6:UITextField!
    @IBOutlet weak var f7:UITextField!
    @IBOutlet weak var idarkMode:UISwitch!
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
             let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
            tap.cancelsTouchesInView = false
            view.addGestureRecognizer(tap)
        if defaults.bool(forKey: "launchedBefore") {
            let p1 = "57**&^$$%48"
            let p2 = "57**&^$$%48"
            let p3 = "57**&^$$%48"
            let p4  = "57**&^$$%48"
            let p5A = "57**&^$$%48"
            let p5B = "57**&^$$%48"
            let p6 = "57**&^$$%48"
            let p7 = "57**&^$$%48"
            defaults.set(p1, forKey: "1111")
            defaults.set(p2, forKey: "2222")
            defaults.set(p3, forKey: "3333")
            defaults.set(p4, forKey: "4444")
            defaults.set(p5A, forKey: "5555A")
            defaults.set(p5B, forKey: "5555B")
            defaults.set(p6, forKey: "6666")
            defaults.set(p7, forKey: "7777")
        }
        let pd1 = defaults.object(forKey: "1111") as! String
        let pd2 = defaults.object(forKey: "2222") as! String
        let pd3 = defaults.object(forKey: "3333") as! String
        let pd4 = defaults.object(forKey: "4444") as! String
        let pd5A = defaults.object(forKey: "5555A") as! String
        let pd5B = defaults.object(forKey: "5555B") as! String
        let pd6 = defaults.object(forKey: "6666") as! String
        let pd7 = defaults.object(forKey: "7777") as! String
        if defaults.bool(forKey: "idarkMode") {
            overrideUserInterfaceStyle = .dark
            idarkMode.setOn(true, animated: false)
            }
            else {
                overrideUserInterfaceStyle = .light
                idarkMode.setOn(false, animated: false)
                }
        print(pd1)
        if pd1 != "57**&^$$%48" {
            print("Default 1 Set")
            f1.text = pd1
            print(pd1)
        }else {
            print("No Default 1")
        }
        if pd2 != "57**&^$$%48" {
            print("Default 2 Set")
            f2.text = pd2
            print(pd2)
        }else {
            print("No Default 2")
        }
        if pd3 != "57**&^$$%48" {
            print("Default 3 Set")
            f3.text = pd3
            print(pd3)
        }else {
            print("No Default 3 ")
        }
        if pd4 != "57**&^$$%48" {
            print("Default 4 Set")
            f4.text = pd4
            print(pd4)
        }else {
            print("No Default 4 ")
        }
        if pd5A != "57**&^$$%48" {
            print("Default 5A Set")
            f5A.text = pd5A
        }else {
            print("No Default 5A ")
        }
        if pd5B != "57**&^$$%48" {
            print("Default 5B Set")
            f5B.text = pd5B
        }else {
            print("No Default 5B ")
        }
        if pd6 != "57**&^$$%48" {
            print("Default 6 Set")
            f6.text = pd6
        }else {
            print("No Default 6 ")
        }
        if pd7 != "57**&^$$%48" {
            print("Default 7 Set")
            f7.text = pd7
        }else {
            print("No Default 7 ")
        }
        
    }
    
    let n = NormalVC()
    @IBAction func updateF1() {
        let pd1 = defaults.object(forKey: "1111") as! String
        if let f1S = f1.text {
            if f1S != pd1 {
                print("Incorrect Default")
                defaults.set(f1S, forKey: "1111")
                print("New Default Set")
            }else {
                print("Correct Default")
            }
        }
    }
    @IBAction func updateF2() {
        let pd2 = defaults.object(forKey: "2222") as! String
        if let f2S = f2.text {
            if f2S != pd2 {
                print("Incorrect Default")
                defaults.set(f2S, forKey: "2222")
                print("New Default Set")
            }else {
                print("Correct Default")
            }
        }
    }
    @IBAction func updateF3() {
        let pd3 = defaults.object(forKey: "3333") as! String
        if let f3S = f3.text {
            if f3S != pd3 {
                print("Incorrect Default")
                defaults.set(f3S, forKey: "3333")
                print("New Default Set")
            }else {
                print("Correct Default")
            }
        }
    }
    @IBAction func updateF4() {
        let pd4 = defaults.object(forKey: "4444") as! String
        if let f4S = f4.text {
            if f4S != pd4 {
                print("Incorrect Default")
                defaults.set(f4S, forKey: "4444")
                print("New Default Set")
            }else {
                print("Correct Default")
            }
        }
    }
    @IBAction func updateF5A() {
        let pd5A = defaults.object(forKey: "5555A") as! String
        if let f5AS = f5A.text {
            if f5AS != pd5A {
                print("Incorrect Default")
                defaults.set(f5AS, forKey: "5555A")
                print("New Default Set")
            }else {
                print("Correct Default")
            }
        }
    }
    @IBAction func updateF5B() {
        let pd5B = defaults.object(forKey: "5555B") as! String
        if let f5BS = f5B.text {
            if f5BS != pd5B {
                print("Incorrect Default")
                defaults.set(f5BS, forKey: "5555B")
                print("New Default Set")
            }else {
                print("Correct Default")
            }
        }
    }
    @IBAction func updateF6() {
        let pd6 = defaults.object(forKey: "6666") as! String
        if let f6S = f6.text {
            if f6S != pd6 {
                print("Incorrect Default")
                defaults.set(f6S, forKey: "6666")
                print("New Default Set")
            }else {
                print("Correct Default")
            }
        }
    }
    @IBAction func updateF7() {
        let pd7 = defaults.object(forKey: "7777") as! String
        if let f7S = f7.text {
            if f7S != pd7 {
                print("Incorrect Default")
                defaults.set(f7S, forKey: "7777")
                print("New Default Set")
            }else {
                print("Correct Default")
            }
        }
    }
    @IBAction func tDarkMode(_ sender: Any) {
        if idarkMode.isOn {
            defaults.set(true, forKey: "idarkMode")
            overrideUserInterfaceStyle = .dark
            }
        else {
            defaults.set(false, forKey: "idarkMode")
            overrideUserInterfaceStyle = .light
            }
        print("Dark Mode = ", idarkMode.isOn)
    }
    
}
