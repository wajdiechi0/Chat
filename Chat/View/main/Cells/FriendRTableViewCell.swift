//
//  FriendRTableViewCell.swift
//  Chat
//
//  Created by Wajdi on 2/25/18.
//  Copyright © 2018 Wajdi. All rights reserved.
//

import UIKit
import Firebase

class FriendRTableViewCell: UITableViewCell {
    var email1 : String?
    var name1 : String?
    var i : Int?
    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    let dr = Database.database().reference()

    @IBAction func accept(_ sender: Any) {
        
        dr.child("Users").child(ViewController.profileEmail!).child("Friends").updateChildValues([email1! : name1!])
        dr.child("Users").child(ViewController.profileEmail!).child("Friend Requests").child(email1!).removeValue()
        friendsViewController.listF.remove(at: i!)
    }
    @IBAction func decline(_ sender: Any) {
        dr.child("Users").child(ViewController.profileEmail!).child("Friend Requests").child(email1!).removeValue()
        friendsViewController.listF.remove(at: i!)
    }
    
}
