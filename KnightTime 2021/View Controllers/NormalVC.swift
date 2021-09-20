//
//  NormalVC.swift
//  KnightTime 2021
//
//  Created by Dodson, Hayes on 9/13/21.
//

import UIKit


class NormalVC: UIViewController {
    @IBOutlet weak var Period1: UILabel!
    @IBOutlet weak var Period2: UILabel!
    @IBOutlet weak var Period3: UILabel!
    @IBOutlet weak var Period4: UILabel!
    @IBOutlet weak var Period5A: UILabel!
    @IBOutlet weak var Period5B: UILabel!
    @IBOutlet weak var Period6: UILabel!
    @IBOutlet weak var Period7: UILabel!

        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
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
        Period1.text = pd1
        Period2.text = pd2
        Period3.text = pd3
        Period4.text = pd4
        Period5A.text = pd5A
        Period5B.text = pd5B
        Period6.text = pd6
        Period7.text = pd7
        if defaults.bool(forKey: "idarkMode") {
            overrideUserInterfaceStyle = .dark
        }
        else {
            overrideUserInterfaceStyle = .light
        }
    }
}

