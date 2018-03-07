//
//  ViewController2.swift
//  Chat
//
//  Created by Wajdi on 2/26/18.
//  Copyright © 2018 Wajdi. All rights reserved.
//

import UIKit
import ALTextInputBar
class ViewController2: UIViewController,UITextViewDelegate {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var textV: UITextView!
    let MAXWIDTH = 200
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textV.delegate = self
        
        let image = UIImage(named : "chat_bubble_sent")
        img.image = image?.resizableImage(withCapInsets: UIEdgeInsets(top: 17, left: 21, bottom: 17, right: 21))
        
        
        // Do any additional setup after loading the view.
    }


  
    @IBOutlet weak var t2: UITextView!
    @IBOutlet weak var tWidth: NSLayoutConstraint!
    @IBAction func `do`(_ sender: Any) {
        let font = UIFont(name: "Helvetica", size: 17)
        let fontAttributes = [NSAttributedStringKey.font: font]
        let myText = t2.text!
        let size = (myText as NSString).size(withAttributes: fontAttributes)
        if (size.width > CGFloat(MAXWIDTH))
        {
            tWidth.constant = CGFloat(MAXWIDTH)
        }
        else{
            tWidth.constant = size.width+15
        }
        textV.text = t2.text
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // Another ingredient in the magic sauce


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
