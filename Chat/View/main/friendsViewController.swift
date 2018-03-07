//
//  friendsViewController.swift
//  Chat
//
//  Created by Wajdi on 2/12/18.
//  Copyright © 2018 Wajdi. All rights reserved.
//

import UIKit
import Firebase
class friendsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    let dr = Database.database().reference()
    struct friend {
        var name : String
        var email : String
    }
    static var listF : [friend]  = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableV.delegate = self
        self.tableV.dataSource = self
        
        self.tableV.tableFooterView = UIView()
        dr.child("Users").child(ViewController.profileEmail!).child("Friend Requests").observe(.childRemoved) { (snap2) in
            self.tableV.reloadData()
        }
        
        dr.child("Users").child(ViewController.profileEmail!).child("Friend Requests").observe(.childAdded) { (snap) in
            friendsViewController.listF.append(friend(name: snap.value as! String, email: snap.key))
            self.tableV.reloadData()
        }
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var tableV: UITableView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func addF(_ sender: Any) {
        let alertvc = self.storyboard?.instantiateViewController(withIdentifier: "alertVC")
        alertvc?.modalPresentationStyle = .overCurrentContext
        self.present(alertvc!, animated: true, completion: nil) 
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsViewController.listF.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableV.dequeueReusableCell(withIdentifier: "FriendR") as! FriendRTableViewCell
        cell.name.text = friendsViewController.listF[indexPath.row].name
        cell.email1 = friendsViewController.listF[indexPath.row].email
        cell.i = indexPath.row
        cell.name1 = friendsViewController.listF[indexPath.row].name
        return cell
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
