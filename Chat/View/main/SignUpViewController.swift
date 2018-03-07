//
//  SignUpViewController.swift
//  Chat
//
//  Created by Wajdi on 2/10/18.
//  Copyright © 2018 Wajdi. All rights reserved.
//

import UIKit
import Firebase
class SignUpViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var cPass: UITextField!
    
    
    let dr = Database.database().reference()
    
    struct user{
        let name : String
        let email:String
        let password:String
    }
    var list :[String]=[]
    override func viewDidLoad() {
        super.viewDidLoad()
        dr.child("Users").observe(.childAdded, with: {
            snap in
            self.list.append(snap.key )
        })
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func SignUp(_ sender: Any) {
        if (pass.text! != cPass.text!){
            cPass.tintColor = UIColor.red
        }
        else{
            var exist = false
            var i = 0
            while(i<list.count){
                if (list[i] == email.text!){
                    exist = true
                }
                i = i+1
            }
            if exist == false{
                dr.child("Users").child(email.text!).setValue(["name":name.text!,"password":pass.text!])
            }
                print (list)
            if exist == true {
                
                print("Email Exists")
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
