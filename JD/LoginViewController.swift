//
//  LoginViewController.swift
//  JD
//
//  Created by Arthur Nguyen on 4/27/18.
//  Copyright © 2018 Arthur Nguyen. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func login(_ sender: Any) {
        FIRAuth.auth()?.signInAnonymously(completion: { (user, error) in
            if error != nil{
                print(error)
                return
            }
            print("User logged in anonymously with uid: " + user!.uid)
        })
    }
    
}
