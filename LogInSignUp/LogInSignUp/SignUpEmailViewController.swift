//
//  SignUpEmailViewController.swift
//  LogInSignUp
//
//  Created by Michail Bondarenko on 11/7/18.
//  Copyright © 2018 Michail Bondarenko. All rights reserved.
//

import UIKit

class SignUpEmailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let password = (UIApplication.shared.delegate as? AppDelegate)?.password

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let next = segue.destination as? SignUpPasswordViewController {
            next.email = "valid email"
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
