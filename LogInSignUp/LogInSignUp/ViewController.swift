//
//  ViewController.swift
//  LogInSignUp
//
//  Created by Michail Bondarenko on 11/5/18.
//  Copyright © 2018 Michail Bondarenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var registrationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        registrationButton.layer.shadowOpacity = 0.11
        registrationButton.layer.shadowColor = UIColor.black.cgColor
    }
    
    @IBAction func registrationButton(_ sender: UIButton) {
    }
    

}

