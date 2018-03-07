//
//  ViewController.swift
//  Chat
//
//  Created by Wajdi on 2/8/18.
//  Copyright © 2018 Wajdi. All rights reserved.
//

import UIKit
import Firebase
class ViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pass: UITextField!
    
    struct user {
        let email1 : String
        let name1 : String
        let pass1 : String
    }
    var list : [user] = []
    
    static var slist : [user] = []
    
    static  var profileName : String?
    static  var profileEmail : String?
    static  var profilePassword : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dr = Database.database().reference()
        dr.child("Users").observe(.childAdded) { (snap) in
            let dic = snap.value as! [String : AnyObject]
            self.list.append(user(email1: snap.key, name1: dic["name"]! as! String, pass1: dic["password"]! as! String))
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SignIn(_ sender: Any) {
        var i : Int = 0
        var correct = false
        
        while i<list.count {
            if list[i].email1 == email.text! {
                if list[i].pass1 == pass.text! {
                    print("correct")
                    ViewController.profileName = list[i].name1
                    ViewController.profileEmail = list[i].email1
                    ViewController.profilePassword = list[i].pass1
                    print(ViewController.profilePassword!)
                    correct = true
                }
                else {
                    print ("password incorrect")
                }
            }
                i = i+1
        }
        if (correct){
            ViewController.slist = self.list
            
            performSegue(withIdentifier: "SignInSuccess", sender: nil)
        }
    }
    
}

