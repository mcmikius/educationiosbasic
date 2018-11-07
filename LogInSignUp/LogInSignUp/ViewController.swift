//
//  ViewController.swift
//  LogInSignUp
//
//  Created by Michail Bondarenko on 11/5/18.
//  Copyright © 2018 Michail Bondarenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var registration: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        registration.layer.shadowOpacity = 1
        registration.layer.shadowColor = UIColor.black.cgColor
    }
    @IBAction func registration(_ sender: UIButton) {
    }

}

