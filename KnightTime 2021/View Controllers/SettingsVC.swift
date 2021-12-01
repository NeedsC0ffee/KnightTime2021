//
//  nSVC.swift
//  KnightTime 2021
//
//  Created by Dodson, Hayes on 11/30/21.
//

import Foundation
import UIKit
import SwiftUI

class nSVC: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var f1:UITextField!
    @IBOutlet weak var f2:UITextField!
    @IBOutlet weak var f3:UITextField!
    @IBOutlet weak var f4:UITextField!
    @IBOutlet weak var f5A:UITextField!
    @IBOutlet weak var f5B:UITextField!
    @IBOutlet weak var f6:UITextField!
    @IBOutlet weak var f7:UITextField!
    @IBOutlet weak var idarkMode:UISwitch!
    @IBOutlet weak var f1c:UILabel!
    @IBOutlet weak var f2c:UILabel!
    @IBOutlet weak var f3c:UILabel!
    @IBOutlet weak var f4c:UILabel!
    @IBOutlet weak var f5Ac:UILabel!
    @IBOutlet weak var f5Bc:UILabel!
    @IBOutlet weak var f6c:UILabel!
    @IBOutlet weak var f7c:UILabel!
    @IBOutlet weak var sBGL:UIImageView!
    @IBOutlet weak var sBGD:UIImageView!
    @IBOutlet weak var out:UIButton!
    
    var timer: Timer!
    
  func maxText() {
        let alertController = UIAlertController(title: "Too Many Characters", message:"Maximum 12 Characters", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Accept", style: UIAlertAction.Style.default,handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func dismissSettings(){
        performSegue(withIdentifier: "unwindToSchedule", sender: self)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    func checkMax() {
        if self.f1.text!.count > 13 {
            self.f1.text = ""
            self.maxText()
        }
        if self.f2.text!.count > 13 {
            self.f2.text = ""
            self.maxText()
        }
        if self.f3.text!.count > 13 {
            self.f3.text = ""
            self.maxText()
        }
        if self.f4.text!.count > 13 {
            self.f4.text = ""
            self.maxText()
        }
        if self.f5A.text!.count > 13 {
            self.f5A.text = ""
            self.maxText()
        }
        if self.f5B.text!.count > 13 {
            self.f5B.text = ""
            self.maxText()
        }
        if self.f6.text!.count > 13 {
            self.f6.text = ""
            self.maxText()
        }
        if self.f7.text!.count > 13 {
            self.f7.text = ""
            self.maxText()
        }
    }
    func checkCount() {
        var c1 = self.f1.text!.count
        var c2 = self.f2.text!.count
        var c3 = self.f3.text!.count
        var c4 = self.f4.text!.count
        var c5A = self.f5A.text!.count
        var c5B = self.f5B.text!.count
        var c6 = self.f6.text!.count
        var c7 = self.f7.text!.count
        self.f1c.text = String(c1) + "/13"
        self.f2c.text = String(c2) + "/13"
        self.f3c.text = String(c3) + "/13"
        self.f4c.text = String(c4) + "/13"
        self.f5Ac.text = String(c5A) + "/13"
        self.f5Bc.text = String(c5B) + "/13"
        self.f6c.text = String(c6) + "/13"
        self.f7c.text = String(c7) + "/13"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        f1.delegate = self
        f2.delegate = self
        f3.delegate = self
        f4.delegate = self
        f5A.delegate = self
        f5B.delegate = self
        f6.delegate = self
        f7.delegate = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        timer = Timer.scheduledTimer(withTimeInterval: 0.0, repeats: true, block: { _ in
            self.checkMax()
            self.checkCount()
            if defaults.bool(forKey: "idarkMode") {
                self.overrideUserInterfaceStyle = .dark
                self.fixColor()
                self.sBGD.isHidden = false
                self.sBGL.isHidden = true
            }
            else {
                self.overrideUserInterfaceStyle = .light
                self.fixColor()
                self.sBGD.isHidden = true
                self.sBGL.isHidden = false
            }
        })
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        self.timer.invalidate()
        if defaults.bool(forKey: "idarkMode") {
            self.overrideUserInterfaceStyle = .dark
            self.fixColor()
            self.sBGD.isHidden = false
            self.sBGL.isHidden = true
        }
        else {
            self.overrideUserInterfaceStyle = .light
            self.fixColor()
            self.sBGD.isHidden = true
            self.sBGL.isHidden = false
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
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
            self.fixColor()
            idarkMode.setOn(true, animated: false)
            }
            else {
                overrideUserInterfaceStyle = .light
                self.fixColor()
                idarkMode.setOn(false, animated: false)
                }
        if defaults.bool(forKey: "idarkMode") {
            self.overrideUserInterfaceStyle = .dark
            self.sBGD.isHidden = false
            self.sBGL.isHidden = true
            self.fixColor()
        }
        else {
            self.overrideUserInterfaceStyle = .light
            self.sBGD.isHidden = true
            self.sBGL.isHidden = false
            self.fixColor()
        }
        if pd1 != "57**&^$$%48" {
            print("Default 1 Set")
            f1.text = pd1
            
        }else {
            print("No Default 1")
        }
        if pd2 != "57**&^$$%48" {
            print("Default 2 Set")
            f2.text = pd2
            
        }else {
            print("No Default 2")
        }
        if pd3 != "57**&^$$%48" {
            print("Default 3 Set")
            f3.text = pd3
            
        }else {
            print("No Default 3 ")
        }
        if pd4 != "57**&^$$%48" {
            print("Default 4 Set")
            f4.text = pd4
            
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
            if f1S == "" {
                f1.text = "Period 1"
                defaults.set(f1.text, forKey: "1111")
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
            if f2S == "" {
                f2.text = "Period 2"
                defaults.set(f2.text, forKey: "2222")
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
            if f3S == "" {
                f3.text = "Period 3"
                defaults.set(f3.text, forKey: "3333")
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
            if f4S == "" {
                f4.text = "Period 4"
                defaults.set(f4.text, forKey: "4444")
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
            if f5AS == "" {
                f5A.text = "Period 5A"
                defaults.set(f5A.text, forKey: "5555A")
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
            if f5BS == "" {
                f5B.text = "Period 5B"
                defaults.set(f5B.text, forKey: "5555B")
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
            sBGD.isHidden = false
            sBGL.isHidden = true
            out.tintColor = .white
            fixColor()
            }
        else {
            defaults.set(false, forKey: "idarkMode")
            overrideUserInterfaceStyle = .light
            sBGL.isHidden = false
            sBGD.isHidden = true
            out.tintColor = .white
            fixColor()
            }

    }
    func fixColor() {
        f1.tintColor = .blue
        f2.tintColor = .blue
        f3.tintColor = .blue
        f4.tintColor = .blue
        f5A.tintColor = .blue
        f5B.tintColor = .blue
        f6.tintColor = .blue
        f7.tintColor = .blue
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        textField.returnKeyType = .done
        return true
        }
    
}
