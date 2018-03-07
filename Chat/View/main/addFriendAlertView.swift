//
//  addFriendAlertView.swift
//  Chat
//
//  Created by Wajdi on 2/18/18.
//  Copyright © 2018 Wajdi. All rights reserved.
//

import UIKit
import Firebase
class addFriendAlertView: UIViewController {

    override func viewDidLoad() {
        self.result.isHidden = true
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    let dr = Database.database().reference()
    
    @IBOutlet weak var toEmail: UITextField!
    @IBOutlet weak var result: UILabel!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func exit(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func sendR(_ sender: Any) {
        var i = 0
        var isExist = false
        var sent = false
        result.text = "Sent"
        while (i<ViewController.slist.count){
            if(ViewController.slist[i].email1 == self.toEmail.text){
                isExist = true
                dr.child("Users").child(toEmail.text!).child("Friend Requests").observeSingleEvent(of:.value, with: { (snapF) in
                    
                    if(snapF.value as? NSDictionary != nil){
                        let d = snapF.value as! NSDictionary
                        for x in d.allKeys {
                            if x as? String == ViewController.profileEmail {
                                sent = true
                            }
                        }
                    }
                    if sent {
                        self.result.text = "Request already sent"
                    }
                    else {
                        self.dr.child("Users").child(self.toEmail.text!).child("Friend Requests").updateChildValues([ViewController.profileEmail! : ViewController.profileName!])
                    }
                    self.result.alpha = 1
                    self.result.isHidden = false
                    self.result.textColor = UIColor.blue
                    UIView.animate(withDuration: 1, animations: {
                        self.result.alpha = 0
                    })
                })
            }
            
            i = i+1
        }
        
        if isExist == false{
            self.result.text = "Email not found"
            
            self.result.alpha = 1
            self.result.isHidden = false
            self.result.textColor = UIColor.blue
            
            UIView.animate(withDuration: 1, animations: {
                self.result.alpha = 0
            })
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


