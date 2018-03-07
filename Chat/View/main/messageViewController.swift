//
//  messageViewController.swift
//  Chat
//
//  Created by Wajdi on 2/12/18.
//  Copyright © 2018 Wajdi. All rights reserved.
//

import UIKit

class messageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        super.viewDidDisappear(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true )
        super.viewWillAppear(true)
    }

    @IBAction func sendM(_ sender: Any) {
        let alertV = storyboard?.instantiateViewController(withIdentifier: "selectF") as! selectFriendViewController
        alertV.modalPresentationStyle = .overCurrentContext
        self.navigationController?.pushViewController(alertV, animated: true)
    }
    

}
