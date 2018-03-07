//
//  TabBar2.swift
//  Chat
//
//  Created by Wajdi on 3/7/18.
//  Copyright © 2018 Wajdi. All rights reserved.
//

import UIKit
import FoldingTabBar

class TabBar2: YALFoldingTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstItem = YALTabBarItem(
            itemImage: UIImage(named: "chat_bubble_sent")!,
            leftItemImage: nil,
            rightItemImage: nil
        )
        
        let secondItem = YALTabBarItem(
            itemImage: UIImage(named: "message")!,
            leftItemImage: UIImage(named: "message")!,
            rightItemImage: nil
        )
        leftBarItems = [firstItem, secondItem]
        
        //rightBarItems
        
        let thirdItem = YALTabBarItem(
            itemImage: UIImage(named: "message")!,
            leftItemImage: UIImage(named: "message")!,
            rightItemImage: UIImage(named: "message")!
        )
        
        let forthItem = YALTabBarItem(
            itemImage: UIImage(named: "message")!,
            leftItemImage: nil,
            rightItemImage: nil
        )
        
        rightBarItems = [thirdItem, forthItem]
        centerButtonImage = UIImage(named: "message")!
    }
        // Do any additional setup after loading the view.
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension TabBar2: YALTabBarDelegate {
    func tabBar(_ tabBar: YALFoldingTabBar, didSelectItemAt index: UInt) {
        tabBarView.centerButton.setImage((leftBarItems[index.hashValue] as! YALTabBarItem).itemImage! , for: .normal)
    }
}
