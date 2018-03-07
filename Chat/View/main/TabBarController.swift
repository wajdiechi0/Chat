//
//  TabViewController.swift
//  Chat
//
//  Created by Wajdi on 2/16/18.
//  Copyright © 2018 Wajdi. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    static let TABBAR_MESSAGESVS_INDEX = 1
    
    static var ref: TabBarController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        TabBarController.ref = self
        
        self.selectedIndex = 1
        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
