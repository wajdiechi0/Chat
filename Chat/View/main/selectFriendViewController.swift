//
//  selectFriendViewController.swift
//  Chat
//
//  Created by Wajdi on 2/25/18.
//  Copyright © 2018 Wajdi. All rights reserved.
//

import UIKit
import Firebase
class selectFriendViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    

    @IBOutlet weak var friendsTableV: UITableView!
    let dr = Database.database().reference()
    
    struct friend {
        var name : String
        var email : String
    }
    
    var listF : [friend] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.friendsTableV.delegate = self
        self.friendsTableV.dataSource = self
        self.friendsTableV.tableFooterView = UIView()
        dr.child("Users").child(ViewController.profileEmail!).child("Friends").observeSingleEvent(of: .childAdded) { (snap) in
            self.listF.append(friend(name: snap.value as! String, email: snap.key))
            self.friendsTableV.reloadData()
        }
        // Do any additional setup after loading the view.
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Messages", style: .plain, target: nil, action: nil)
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listF.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = friendsTableV.dequeueReusableCell(withIdentifier: "selectF") as! selectFriendTableViewCell
        cell.name.text = listF[indexPath.row].name
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatVC = storyboard?.instantiateViewController(withIdentifier: "Chat")
        chatVC?.navigationItem.title = listF[indexPath.row].name
        self.navigationController?.pushViewController(chatVC!, animated: true)
    }
    

    
    

    

}
